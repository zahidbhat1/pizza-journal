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
import 'package:pizzajournals/presenter/pages/discover/widget/review_images.dart';
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

class _PizzaPlacePageState extends State<PizzaPlacePage> {
  DiscoverBloc get _discoverBloc => context.read<DiscoverBloc>();

  void _handleSuggestionAction(bool isOwner) {
    if (isOwner) {
      print('owner');
      context.router.push(
        SuggestionsRoute(
          pizzaPlaceId: widget.arguments?.pizzaPlaceModel?.id ?? '',
        ),
      );
    } else {
      // Show suggestion modal for non-owners
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return Stack(
        children: [
          Scaffold(
            body: _buildBody(),
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
    var reviews = _discoverBloc.state.reviews?.reviews ?? [];
    if (reviews.isEmpty) {
      return 0.0; // Return 0 if there are no reviews
    }

    // Sum up all the star ratings
    int totalStars =
        reviews.fold(0, (sum, review) => sum + (review?.stars ?? 0));

    // Calculate and return the average
    return totalStars / reviews.length;
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

  Widget _buildBody() {
    final userId = context.read<AuthBloc>().state.user?.id;
    // final bool isOwner = userId == widget.arguments?.pizzaPlaceModel?.ownerId;
    final pizzaReview = _discoverBloc.state.reviews;
    final ownerId = pizzaReview?.userId;
    final bool isOwner = userId == ownerId;
    print('User ID: $userId, Owner ID: $ownerId');

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
              Positioned(
                  bottom: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      widget.arguments?.pizzaPlaceModel?.name ?? '',
                      style:
                          const TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  )),
              Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Row(
                      children: [
                        Text(
                          'Rating: ${getAverageRating()}/ 5',
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${_discoverBloc.state.reviews?.reviews?.length}',
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.white),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                        "${widget.arguments?.pizzaPlaceModel?.address?.street} "),
                    Text(
                        "${widget.arguments?.pizzaPlaceModel?.address?.state} ${widget.arguments?.pizzaPlaceModel?.address?.zip}"),
                  ],
                ),
                const Spacer(),
                const Spacer(),
                _buildSuggestionButton(isOwner),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Review Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Crust"),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      Text("Thick"),
                                      Text("Thin"),
                                      Text("Average"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.crust!
                                                                    .crustThick ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.main,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.crust!
                                                                    .crustThin ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.crust!
                                                                    .crustAverage ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.lightOrange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Text("Crispy"),
                        Text("${getCrispyPercentage()}%")
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sauce"),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Sweet"),
                                      Text("Spicy"),
                                      Text("No flavor"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.sauce!
                                                                    .sauceSweet ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.main,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.sauce!
                                                                    .sauceSpicy ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.sauce!
                                                                    .sauceNoFlavour ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.lightOrange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Column(
                      children: [Text("Dry"), Text("80%")],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Cheese"),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Great"),
                                      Text("Ehh"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.cheese!
                                                                    .cheeseGreat ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.main,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey2,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          Container(
                                            width: (((_discoverBloc
                                                                    .state
                                                                    .reviews
                                                                    ?.summary
                                                                    ?.cheese!
                                                                    .cheeseEhh ??
                                                                0)
                                                            .toDouble() ??
                                                        0.0) /
                                                    100) *
                                                80,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: AppColors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Column(
                      children: [Text("Fluffy"), Text("80%")],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_discoverBloc.state.myReview != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Your Review"),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                (_discoverBloc.state.myReview?.stars ?? 0) > 0
                                    ? AppColors.green
                                    : AppColors.grey2,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                (_discoverBloc.state.myReview?.stars ?? 0) > 1
                                    ? AppColors.green
                                    : AppColors.grey2,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                (_discoverBloc.state.myReview?.stars ?? 0) > 2
                                    ? AppColors.green
                                    : AppColors.grey2,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                (_discoverBloc.state.myReview?.stars ?? 0) > 3
                                    ? AppColors.green
                                    : AppColors.grey2,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                (_discoverBloc.state.myReview?.stars ?? 0) > 4
                                    ? AppColors.green
                                    : AppColors.grey2,
                          ),
                        ],
                      ),
                      Text(_discoverBloc.state.myReview?.description ?? '',
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.grey)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                else
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
                              _discoverBloc.add(DiscoverAddPlaceReview(data));
                              Navigator.pop(context);
                            });
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(10)),
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
                const Row(
                  children: [
                    Text("Traditional Pizza",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text("3.1 miles away",
                        style: TextStyle(fontSize: 18, color: AppColors.grey)),
                  ],
                ),
                if (_discoverBloc.state.reviews != null)
                  Column(
                    children: _discoverBloc.state.reviews!.reviews!.map((item) {
                      return buildItem(
                          item); // Use parentheses instead of curly braces
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
    return Container(
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
        ],
      ),
    );
  }
}
