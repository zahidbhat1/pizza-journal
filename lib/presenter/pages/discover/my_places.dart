import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/states/discover/discover_bloc.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/data/states/discover/discover_state.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/widgets/cached_image.dart';

@RoutePage()
class MyPlacesPage extends StatefulWidget {
  const MyPlacesPage({super.key});

  @override
  State<MyPlacesPage> createState() => _MyPlacesPageState();
}

class _MyPlacesPageState extends State<MyPlacesPage> with AutoRouteAware {
  DiscoverBloc get _discoverBloc => context.read<DiscoverBloc>();
  AutoRouteObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    _observer?.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    // Called when another page is pushed on top of this page
  }

  @override
  void didPopNext() {
    // Called when a pushed page is popped
    _initialize();
  }

  @override
  void didChangeTabRoute(TabPageRoute tabPageRoute) {
    // Called when switching to this tab
    _initialize();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    print("Fetching my places..."); // Add this debug log
    _discoverBloc.add(const DiscoverLoadUserPlaces());
  }

  Widget _buildItem(PizzaPlaceModel item) {
    final firstImage = item.photos.isNotEmpty
        ? (item.photos[0] is List
            ? (item.photos[0] as List)
                .first
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')
                .replaceAll('"', '')
                .split(',')[0]
            : item.photos[0]
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')
                .replaceAll('"', '')
                .split(',')[0])
        : '';

    final imageUrl = "https://pizzajournals.com/places/$firstImage";

    return GestureDetector(
      onTap: () {
        _discoverBloc.add(DiscoverEvent.pizzaPlace(item));
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey2, width: 1)),
        margin: const EdgeInsets.only(top: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedImage(
                width: 100,
                height: 100,
                placeholderImageAsset: Assets.images.placeholderRestaurant,
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('Rating: ${item.averageRating ?? 0} / 5',
                        style: const TextStyle(color: AppColors.grey)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(Icons.star, size: 18, color: AppColors.main),
                    ),
                    Text('(${item.ratings ?? 0})',
                        style: const TextStyle(color: AppColors.grey)),
                  ],
                ),
                const Text('3.1 km away',
                    style: TextStyle(color: AppColors.grey)),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Places')),
      body: BlocBuilder<DiscoverBloc, DiscoverState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  _initialize();
                },
                child: state.showLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.userPizzaPlaces.isEmpty
                        ? const Center(child: Text('No places found'))
                        : ListView.builder(
                            itemCount: state.userPizzaPlaces.length,
                            itemBuilder: (context, index) {
                              return _buildItem(state.userPizzaPlaces[index]);
                            },
                          ),
              ),
            ),
          );
        },
      ),
    );
  }
}
