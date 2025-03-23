import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';
import 'package:pizzajournals/data/states/discover/discover_bloc.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/data/states/discover/discover_state.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/modals/halal_info_modal.dart';
import 'package:pizzajournals/presenter/pages/discover/place_detail_arguments.dart';
import 'package:pizzajournals/presenter/pages/discover/widget/adress_expendable.dart';

import 'package:pizzajournals/presenter/pages/discover/widget/review_images_full.dart';
import 'package:pizzajournals/presenter/pages/discover/widget/review_summary.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/widgets/cached_image.dart';
import 'package:pizzajournals/utils/extensions/string_extensions.dart';

import '../../../data/states/auth/auth_bloc.dart';
import '../../modals/suggest_edit_model.dart';
import '../../navigation/navigation.dart';

@RoutePage()
class PizzaPlacePage extends StatefulWidget {
  final PizzaPlaceArguments? arguments;

  const PizzaPlacePage({
    super.key,
    @QueryParam('arguments') required this.arguments,
  });

  @override
  State<PizzaPlacePage> createState() => _PizzaPlacePageState();

  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DiscoverBloc>(
      create: (context) => DiscoverBloc(
        router: getIt(),
        alertManager: getIt(),
        actionBloc: getIt(),
        userRepository: getIt(),
        authBloc: getIt(),
      ),
      child: this,
    );
  }
}

class _PizzaPlacePageState extends State<PizzaPlacePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _pizzaTypes = [];
  String _selectedPizzaType = "Traditional Round";

  DiscoverBloc get _discoverBloc => context.read<DiscoverBloc>();
  List<Review?> _filterReviewsByType(String pizzaType) {
    final reviews = _discoverBloc.state.reviews?.reviews ?? [];
    return reviews.where((review) => review?.pizzaType == pizzaType).toList();
  }


  void _handleSuggestionAction(bool isOwner) {
    if (isOwner) {
      print('owner');
      context.router.push(
        SuggestionsRoute(
          pizzaPlaceId: widget.arguments?.pizzaPlaceModel?.id ?? '',
        ),
      );
    } else {

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SuggestEditModal(
          pizzaPlace: widget.arguments!.pizzaPlaceModel!,
        ),
      );
    }
  }

  Widget _buildSuggestionButton(bool isOwner) {
    return GestureDetector(
      onTap: () => _handleSuggestionAction(isOwner),
      child: Row(
        children: [
          Text(
            isOwner ? "View suggestions " : "Suggest an edit ",
            style: const TextStyle(color: AppColors.main),
          ),
          Icon(
            isOwner ? Icons.list_alt : Icons.edit,
            size: 16,
            color: AppColors.main,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();

    _pizzaTypes = [

      'Traditional Round',
      'Sicilian/Square',
      'Personal',
      'Grandma/Square',
      'Deep Dish',
    ];
    _tabController = TabController(length: _pizzaTypes.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != _tabController.previousIndex) {
        setState(() {
          _selectedPizzaType = _pizzaTypes[_tabController.index];
        });

        _discoverBloc.add(DiscoverSelectPizzaType(_selectedPizzaType));
      }
    });
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      final filteredReviews = _filterReviewsByType(_selectedPizzaType);
      return Stack(
        children: [
          Scaffold(
            body: _buildBody(filteredReviews),
          ),
          if (_discoverBloc.state.showLoading)
            Container(
              color:
                  Colors.black.withOpacity(0.2), // Semi-transparent background
              child: const Center(
                child: CircularProgressIndicator(), // The loader
              ),
            ),
        ],
      );
    });
  }

  void _initialize() {
    scheduleMicrotask(() async {
      if (widget.arguments != null) {
        _discoverBloc
            .add(DiscoverPizzaPlaceReviews(widget.arguments!.pizzaPlaceModel!));
      }
    });
  }

  double getAverageRating() {
    final summaries = _discoverBloc.state.reviews?.summaries;
    if (summaries == null || summaries[_selectedPizzaType] == null) {
      return 0.0; // No data available
    }

    final pizzaSummary = summaries[_selectedPizzaType]!;
    return double.parse(pizzaSummary.averageRating.toStringAsFixed(1)); // ✅ Round to 2 decimal places
  }


  int getReviewCount() {
    final summaries = _discoverBloc.state.reviews?.summaries;
    if (summaries == null || summaries[_selectedPizzaType] == null) {
      return 0; // No data available
    }

    final pizzaSummary = summaries[_selectedPizzaType]!;
    return pizzaSummary.count;
  }



  int getCrispyPercentage() {
    var reviews = _discoverBloc.state.reviews?.reviews ?? [];
    if (reviews.isEmpty) {
      return 0; // Return 0% if no reviews exist
    }

    int totalReviews = reviews.length;
    int crispyCount =
        reviews.where((review) => review?.crust?.crispy == true).length;

    return ((crispyCount / totalReviews) * 100).toInt();
  }

  Widget _buildBody(List<Review?> filteredReviews){
    final userId = context.read<AuthBloc>().state.user?.id;
    // final bool isOwner = userId == widget.arguments?.pizzaPlaceModel?.ownerId;
    final pizzaReview = _discoverBloc.state.reviews;
    final ownerId = pizzaReview?.userId;
    final bool isOwner = userId == ownerId;
    print('User ID: $userId, Owner ID: $ownerId');
    final myReviewForSelectedType = _discoverBloc.state.reviews?.reviews
        ?.firstWhere(
          (review) =>
      review?.user?.id == userId && review?.pizzaType == _selectedPizzaType,
      orElse: () => null,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Builder(builder: (context) {
                  // Get all photos and split them into individual URLs
                  final photos = widget.arguments!.pizzaPlaceModel!.photos;
                  List<String> allPhotos = [];

                  if (photos[0] is List) {
                    // If it's a nested list, get all URLs from the first list
                    String photoString = photos[0]
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', '')
                        .replaceAll('"', '');
                    allPhotos = photoString
                        .split(',')
                        .map((url) => url.trim())
                        .toList();
                  } else {
                    // If it's a simple list, split each entry by comma
                    String photoString = photos
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', '')
                        .replaceAll('"', '');
                    allPhotos = photoString
                        .split(',')
                        .map((url) => url.trim())
                        .toList();
                  }

                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      final imageUrl =
                          "https://pizzajournals.com/places/${allPhotos[index]}";

                      // Debug print statement
                      print("Swiper Image URL at index $index: $imageUrl");

                      return CachedImage(
                        imageUrl: imageUrl,
                        placeholderImageAsset:
                            Assets.images.placeholderRestaurant,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: AppColors.grey2,
                            activeColor: AppColors.main,
                            size: 10.0,
                            space: 6.0,
                            activeSize: 10.0)),
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    itemCount: allPhotos.length,
                    scrollDirection: Axis.horizontal,
                  );
                }),
              ),
              Positioned(
                top: 55,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.black,
                        size: 18, // Adjust if necessary
                      ),
                    ),
                  ),
                ),
              ),
              if (getReviewCount() > 0) // ✅ Only show if reviews exist
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${getAverageRating().toStringAsFixed(1)}/5', // ✅ Dynamically fetch rating
                              style: const TextStyle(fontSize: 18, color: AppColors.white),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.star, size: 20, color: AppColors.white),
                            const SizedBox(width: 10),
                            Text(
                              '${getReviewCount()}', // ✅ Dynamically fetch count
                              style: const TextStyle(fontSize: 18, color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),



            ],
          ),




          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Show Pizza Place Name Below Rating Section
                Text(
                  widget.arguments?.pizzaPlaceModel?.name ?? "No Name Available",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 1), // Add spacing before ExpandableAddress

                Row(
                  children: [
                    // ✅ Expandable Address remains below the name
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ExpandableAddress(
                        street: widget.arguments?.pizzaPlaceModel?.address?.street,
                        city: widget.arguments?.pizzaPlaceModel?.address?.city,
                        zip:widget.arguments?.pizzaPlaceModel?.address?.zip,
                      ),
                    ),

                    const Spacer(),
                    _buildSuggestionButton(isOwner),
                  ],
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
          ),

          DefaultTabController(
            length: _pizzaTypes.length,
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: AppColors.main,
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: AppColors.main,
                    padding: EdgeInsets.zero,
                    tabs: _pizzaTypes.map((type) {
                      return Tab(text: type);
                    }).toList(),
                    onTap: (index) {
                      setState(() {
                        _selectedPizzaType = _pizzaTypes[index];
                      });
                      _discoverBloc.add(DiscoverSelectPizzaType(_selectedPizzaType));
                    },
                  ),
                ),

                Builder(
                  builder: (context) {

                    final hasSummary = _discoverBloc.state.reviews?.summaries?[_selectedPizzaType] != null;

                    final height = hasSummary ? 400.0 : 150.0;

                    return SizedBox(
                      height: height,
                      child: TabBarView(
                        controller: _tabController,
                        children: _pizzaTypes.map((type) {
                          return ReviewSummaryWidget(
                            pizzaType: type,
                            reviews: _discoverBloc.state.reviews,
                            getCrispyPercentage: getCrispyPercentage,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // reviews

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (myReviewForSelectedType == null)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return HalalInfoModal(onSubmit: (data) {


                              data["pizzaPlaceId"] =
                                  widget.arguments?.pizzaPlaceModel?.id;
                              data["photos"] = [];
                              data["pizzaType"] = _selectedPizzaType; // Add selected pizza type
                              _discoverBloc.add(DiscoverAddPlaceReview(data));
                              Navigator.pop(context);
                            },
                              pizzaType: _selectedPizzaType,
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Write A Review",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                const Divider(
                  height: 1,
                  color: AppColors.grey2,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                  children: [
                    Text(
                      _selectedPizzaType, // Dynamic text based on selected pizza type
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Spacer(),
                    Text("3.1 miles away",
                        style: TextStyle(fontSize: 18, color: AppColors.grey)),
                  ],
                ),
                if (_discoverBloc.state.reviews != null)
                  Column(
                    children: filteredReviews.map((item) {
                      return buildItem(item);
                    }).toList(),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(Review? item) {
    final String? currentUserId = context.read<AuthBloc>().state.user?.id;
    final String? itemid = item?.id;
    final bool isCurrentUserReview = item?.user?.id == currentUserId;
    print('item id = $itemid');

    List<String> photoUrls = [];
    if (item?.photos != null && item!.photos!.isNotEmpty) {
      if (item.photos![0] is List) {
        // Handle nested list case
        String photoString = item.photos![0]
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll('"', '');
        photoUrls = photoString.split(',').map((url) => url.trim()).toList();
      } else {
        // Handle simple list case
        String photoString = item.photos
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll('"', '');
        photoUrls = photoString.split(',').map((url) => url.trim()).toList();
      }
    }

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey2,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                children: [
                  Text("${item?.user?.screenName}",
                      style: const TextStyle(fontSize: 20)),
                  const Spacer(),
                  Icon(
                    Icons.star,
                    color:
                    (item?.stars ?? 0) > 0 ? AppColors.green : AppColors.grey2,
                  ),
                  Icon(
                    Icons.star,
                    color:
                    (item?.stars ?? 0) > 1 ? AppColors.green : AppColors.grey2,
                  ),
                  Icon(
                    Icons.star,
                    color:
                    (item?.stars ?? 0) > 2 ? AppColors.green : AppColors.grey2,
                  ),
                  Icon(
                    Icons.star,
                    color:
                    (item?.stars ?? 0) > 3 ? AppColors.green : AppColors.grey2,
                  ),
                  Icon(
                    Icons.star,
                    color:
                    (item?.stars ?? 0) > 4 ? AppColors.green : AppColors.grey2,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${item?.pizzaType}".toUpperCase(),
                    style: const TextStyle(color: AppColors.grey),
                  ),
                  const Spacer(),
                  Text(
                    (item?.createdAt ?? "").convertDateFormat,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ReviewImagesDisplay(photoUrls: photoUrls),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${item?.description}",
                  style: const TextStyle(fontSize: 18, color: AppColors.grey),
                ),
              ),
              // Add some space at the bottom for the icon if it's the current user's review
              if (isCurrentUserReview)
                const SizedBox(height: 24),
            ],
          ),
        ),

        // Position the edit icon at the bottom right corner using Positioned widget
        if (isCurrentUserReview)
          Positioned(
            bottom:20,
            right: 10,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return HalalInfoModal(
                      reviewData: item,
                      onSubmit: (data) {
                        data["pizzaPlaceId"] = widget.arguments?.pizzaPlaceModel?.id ?? '';
                        context.read<DiscoverBloc>().add(
                          DiscoverUpdatePlaceReview(
                            data: data,
                            reviewId: itemid!, // Assuming 'item' has an 'id' field
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                      pizzaType: _selectedPizzaType,
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.main.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.edit,
                  color: AppColors.main,
                  size: 18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
