import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/states/discover/discover_bloc.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/data/states/discover/discover_state.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/pages/discover/place_detail_arguments.dart';
import 'package:pizzajournals/presenter/pages/discover/widget/map_locator.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/widgets/cached_image.dart';

import '../../../utils/alert_manager.dart';
import '../../navigation/navigation.dart';

@RoutePage()
class DiscoverPage extends StatefulWidget {
 // final AlertManager alertManager;
  const DiscoverPage({super.key, });

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<DiscoverBloc>(
      create: (context) => DiscoverBloc(
        router: getIt(),
        actionBloc: getIt(),
        userRepository: getIt(),
        authBloc: getIt(),
        alertManager: getIt(),
      ),
      child: this,
    );
  }
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  void initState() {
    super.initState();
    _initialize();

  }

  String dropdownRatingValue = 'Rating';
  String dropdownRadiusValue = 'Radius';
  String dropdownCrushValue = 'Crush Type';
  String dropdownSauceTypeValue = 'Sweet/Spicy';
  String dropdownCheeseTasteValue = 'Taste';
  String dropdownSauceAmountValue = 'Amount';
  String dropdownCheeseAmountValue = 'Amount';
  String dropdownCrustCrispyValue = 'Crispy';
  String dropdownDryValue = 'Dry (Y/N)';
  String dropdownFluffyValue = 'Fluffy (Y/N)';
  String txtLocation = '';
  String txtPizzaPlace = '';
  String txtUsername = '';

  String pizzaPlace = '';
  String street = '';
  String city = '';
  String state = '';
  String zip = '';
  String phone = '';
  LatLng? selectedLocation;
  String hours = '';
  late Map<String, String> hoursOpen = {};
  String socialLink = '';
  String mapLink = '';
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();


  DiscoverBloc get _discoverBloc => context.read<DiscoverBloc>();

  void _submitSearch() {
    String mapYesNoToString(String value) {
      if (value == 'Yes') return 'true';
      if (value == 'No') return 'false';
      return '';}
    Map<String, String> data = {
      'placeName': txtPizzaPlace,
      'minRating':
          dropdownRatingValue != "Rating" ? dropdownRatingValue[0] : '',
      'sauceSweetOrSpicy': dropdownSauceTypeValue != "Sweet/Spicy"
          ? dropdownSauceTypeValue.toLowerCase()
          : '',
      'sauceAmount': dropdownSauceAmountValue != "Amount"
          ? dropdownSauceAmountValue.toLowerCase()
          : '',
      'cheeseAmount': dropdownCheeseAmountValue != "Amount"
          ? dropdownCheeseAmountValue.toLowerCase()
          : '',
      'cheeseTaste': dropdownCheeseTasteValue != "Taste"
          ? dropdownCheeseTasteValue.toLowerCase()
          : '',
      'crustThickness': dropdownCrushValue != "Crush Type"
          ? dropdownCrushValue.toUpperCase()
          : '',
      'crustCrispy': dropdownCrustCrispyValue != "Crispy"
          ? mapYesNoToString(dropdownCrustCrispyValue)
          : '',
      'dry': dropdownDryValue != "Dry (Y/N)"
          ? mapYesNoToString(dropdownDryValue)
          : '',
      'fluffy': dropdownFluffyValue != "Fluffy (Y/N)"
          ? mapYesNoToString(dropdownFluffyValue)
          : '',
      'screenName': txtUsername,
    };


    _discoverBloc.add(DiscoverEvent.load(data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(child: _buildBody()),
      );
    });
  }

  void _initialize() {
    scheduleMicrotask(() async {
      _discoverBloc.add(const DiscoverLoad(null));
    });
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.grey2, width: 1),
                          ),
                          width: MediaQuery.of(context).size.width * .55,
                          child: TextField(
                            controller: _locationController,
                            textInputAction: TextInputAction.done,
                            // Sets the action to "Done"
                            onSubmitted: (value) {
                              // Triggers when "Done" is pressed
                              if (value.isNotEmpty) {
                                _discoverBloc
                                    .add(DiscoverSearchLocations(value));
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Location / Zipcode',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12.0),
                                child: Image(
                                  image: Assets.images.locationNavigation
                                      .provider(),
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.grey2, width: 1),
                          ),
                          width: MediaQuery.of(context).size.width * .33,
                          child: _buildRadiusDropDown(),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.grey2, width: 1),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 17),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 17),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: AppColors.grey2, width: 1),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  txtPizzaPlace = value;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter Pizza Place',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: AppColors.grey2, width: 1),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  txtUsername = value;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter Username',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildRatingDropDown(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildCrushDropDown(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Sauce'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildSauceTypeDropDown(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildSauceAmountDropDown(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Cheese'),
                            ),
                          ),
                          const SizedBox(height: 10),


                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildCheeseTasteDropDown(context),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildCheeseAmountDropDown(context),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Crust Details'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildCrustCrispyDropDown(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildDryDropDown(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.grey2, width: 1),
                                  ),
                                  child: _buildFluffyDropDown(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // Distribute space evenly
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _submitSearch();
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 15),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.main,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.lightOrange, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Search',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 15),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.main,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.lightOrange, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Save Search',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),

                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     margin: const EdgeInsets.symmetric(vertical: 12),
                              //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              //     decoration: BoxDecoration(
                              //       color: AppColors.main,
                              //       borderRadius: BorderRadius.circular(8),
                              //       border: Border.all(color: AppColors.lightOrange, width: 1),
                              //     ),
                              //     child: const Center(
                              //       child: Text(
                              //         'Save by new name',
                              //         style: TextStyle(color: AppColors.white),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Text(
                          'Search Results',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                if (_locationController.text.isNotEmpty && _discoverBloc.state.locationSuggestions.isNotEmpty)
                  Positioned(
                    top: 60, // Adjust this value based on your layout
                    left: 0,
                    right: MediaQuery.of(context).size.width * .45,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            _discoverBloc.state.locationSuggestions.length,
                        itemBuilder: (context, index) {
                          final suggestion =
                              _discoverBloc.state.locationSuggestions[index];
                          return ListTile(
                            title: Text(suggestion.mainText),
                            subtitle: Text(suggestion.secondaryText),
                            onTap: () {
                              setState(() {
                                _locationController.text =
                                    suggestion.description;
                                _discoverBloc
                                    .add(const DiscoverSearchLocations(''));
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showAddPizzaPlacePopup();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.lightOrange, width: 1),
                ),
                child: const Center(
                  child: Text(
                    'Add New Pizza Place',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),

            if (_discoverBloc.state.showLoading)
              const Center(child: CircularProgressIndicator())
            else if (_discoverBloc.state.pizzaPlaces.isNotEmpty)
              Column(
                children: _discoverBloc.state.pizzaPlaces.map((item) {
                  return _buildItem(item);
                }).toList(),
              )
            else
              Column(
                children: [
                  const Text(
                    'No Pizza Places Found',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
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

    // Create clean URL with just the first image filename
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
                // Shadow color with opacity
                spreadRadius: 1,
                // Spread radius
                blurRadius: 6,
                // Blur radius
                offset: const Offset(
                    0, 3), // changes position of shadow (x-axis, y-axis)
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
                // "https://pizzajournals.com/places/${item.photos[0]!}" ?? '',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text(
                //   'Traditional Round',
                //   style: TextStyle(color: AppColors.grey),
                // ),
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
            const Spacer(),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Container(
            //       height: (((item.summary?.crust!.crustThick ?? 0).toDouble() ??
            //                   0.0) /
            //               100) *
            //           52,
            //       width: 6,
            //       decoration: const BoxDecoration(
            //           color: AppColors.main,
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(10),
            //               topRight: Radius.circular(10))),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Container(
            //       height:
            //           (((item.summary?.sau ?? 0).toDouble() ?? 0.0) / 100) * 52,
            //       width: 6,
            //       decoration: const BoxDecoration(
            //           color: AppColors.darkGreen,
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(10),
            //               topRight: Radius.circular(10))),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Container(
            //       height: (((item.summary?.crust!.crustThick ?? 0).toDouble() ??
            //                   0.0) /
            //               100) *
            //           52,
            //       width: 6,
            //       decoration: const BoxDecoration(
            //           color: AppColors.blue2,
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(10),
            //               topRight: Radius.circular(10))),
            //     ),
            //   ],
            // ),
            // const SizedBox(width: 5),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         Container(
            //           height: 10,
            //           width: 10,
            //           decoration: BoxDecoration(
            //               color: AppColors.main,
            //               borderRadius: BorderRadius.circular(10)),
            //         ),
            //         const SizedBox(width: 4),
            //         const Text(
            //           'Crust',
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis,
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Container(
            //           height: 10,
            //           width: 10,
            //           decoration: BoxDecoration(
            //               color: AppColors.darkGreen,
            //               borderRadius: BorderRadius.circular(10)),
            //         ),
            //         const SizedBox(width: 4),
            //         const Text(
            //           'Sauce',
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis,
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Container(
            //           height: 10,
            //           width: 10,
            //           decoration: BoxDecoration(
            //               color: AppColors.blue2,
            //               borderRadius: BorderRadius.circular(10)),
            //         ),
            //         const SizedBox(width: 4),
            //         const Text(
            //           'Cheese',
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis,
            //         )
            //       ],
            //     )
            //   ],
            // ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingDropDown() {
    return Row(
      children: [
        Expanded(
          // Use Expanded to take available space
          child: DropdownButton<String>(
            value: dropdownRatingValue,
            icon: const Icon(Icons.arrow_drop_down),
            // Use built-in arrow
            elevation: 16,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownRatingValue = newValue!;
              });
            },
            items: <String>[
              'Rating',
              '5 Star',
              '4 Star',
              '3 Star',
              '2 Star',
              '1 Star'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Rating' ? AppColors.grey : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }
  Widget _buildCrustCrispyDropDown() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownCrustCrispyValue == 'Crispy' ? null : dropdownCrustCrispyValue,
            hint: const Text("Crispy"),
            disabledHint: const Text("Crispy"),
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: AppColors.black, fontSize: 14),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              if (newValue != "Crispy") {
                setState(() {
                  dropdownCrustCrispyValue = newValue!;
                });
              }
            },
            items: <String>['Crispy', 'Yes', 'No']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                enabled: value != 'Crispy', // ✅ Disable 'Crispy'
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Crispy' ? AppColors.grey : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }


  Widget _buildDryDropDown() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownDryValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: AppColors.black, fontSize: 14),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownDryValue = newValue!;
              });
            },
            items: <String>['Dry (Y/N)', 'Yes', 'No']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Dry (Y/N)'
                        ? AppColors.grey
                        : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget _buildFluffyDropDown() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownFluffyValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: AppColors.black, fontSize: 14),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownFluffyValue = newValue!;
              });
            },
            items: <String>['Fluffy (Y/N)', 'Yes', 'No']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Fluffy (Y/N)'
                        ? AppColors.grey
                        : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget _buildRadiusDropDown() {
    return Row(
      children: [
        DropdownButton<String>(
          value: dropdownRadiusValue,
          icon: Container(),
          elevation: 16,
          style: const TextStyle(color: AppColors.black),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownRadiusValue = newValue!;
            });
          },
          items: <String>['Radius', 'Option 2', 'Option 3', 'Option 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    color:
                        value == 'Radius' ? AppColors.grey : AppColors.black),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        const Icon(Icons.arrow_downward),
      ],
    );
  }

  Widget _buildCrushDropDown() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownCrushValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownCrushValue = newValue!;
              });
            },
            items: <String>['Crush Type', 'Thick', 'Thin', 'Average']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Crush Type'
                        ? AppColors.grey
                        : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget _buildSauceTypeDropDown() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownSauceTypeValue,
            icon: const Icon(Icons.arrow_drop_down),
            // Use built-in arrow
            elevation: 16,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14, // Adjust font size for small screens
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownSauceTypeValue = newValue!;
              });
            },
            items: <String>['Sweet/Spicy', 'Sweet', 'Spicy', 'No Flavor', 'N/A']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: value == 'Sweet/Spicy'
                        ? AppColors.grey
                        : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true, // Allow the dropdown to expand to fill the space
          ),
        ),
      ],
    );
  }

  Widget _buildSauceAmountDropDown() {
    return Row(
      children: [
        Expanded(
          // Use Expanded to take available space
          child: DropdownButton<String>(
            value: dropdownSauceAmountValue,
            icon: const Icon(Icons.arrow_drop_down),
            // Use built-in arrow
            elevation: 16,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14, // Adjust font size for small screens
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownSauceAmountValue = newValue!;
              });
            },
            items: <String>['Amount', 'Light', 'Heavy', 'Average']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                  style: TextStyle(
                    color: value == 'Amount' ? AppColors.grey : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true, // Allow the dropdown to expand to fill the space
          ),
        ),
      ],
    );
  }

  Widget _buildCheeseTasteDropDown(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize =
        screenWidth < 300 ? 12 : 14; // Adjust font size for small screens

    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownCheeseTasteValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: TextStyle(
              color: AppColors.black,
              fontSize: fontSize, // Dynamic font size
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownCheeseTasteValue = newValue!;
              });
            },
            items: <String>['Taste', 'Great', 'OK', 'Ehh']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                  style: TextStyle(
                    color: value == 'Taste' ? AppColors.grey : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCheeseAmountDropDown(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 300 ? 12 : 14;

    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: dropdownCheeseAmountValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: TextStyle(
              color: AppColors.black,
              fontSize: fontSize, // Dynamic font size
            ),
            underline: Container(height: 0),
            onChanged: (String? newValue) {
              setState(() {
                dropdownCheeseAmountValue = newValue!;
              });
            },
            items: <String>['Amount', 'Light', 'Heavy', 'Average']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                  style: TextStyle(
                    color: value == 'Amount' ? AppColors.grey : AppColors.black,
                  ),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Future<void> _addNewItem() async {
    if (_discoverBloc.state.images.length < 3) {
      _pickImage(_discoverBloc.state.images.length);
    }
  }

  // Initialize with one item for adding images.
  final ImagePicker _picker = ImagePicker();

  void _pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Use `ImageSource.camera` for camera
    );
    if (pickedFile != null) {
      _discoverBloc.add(DiscoverAddImage(File(pickedFile.path), index));
    }
    // final XFile? pickedFile = await _picker.pickImage(
    //   source: ImageSource.gallery, // Use `ImageSource.camera` for camera
    // );
    // if (pickedFile != null) {
    //   // Placeholder image for simulation.
    //   setState(() {
    //     if (images.length == index)
    //       images.add(FileImage(File(pickedFile.path)));
    //     else
    //       images[index] = FileImage(File(pickedFile.path));
    //   });
    // }
  }

  void showAddPizzaPlacePopup() {
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final zipController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocListener<DiscoverBloc, DiscoverState>(
            listener: (context, state) {
              // streetController.text = state.street;
              // cityController.text = state.city;
              // stateController.text = state.stateName;
              // zipController.text = state.pincode;
             // if (state.isPlaceAdded) {
              //   WidgetsBinding.instance.addPostFrameCallback((_) {
              //     widget.alertManager.showSuccess(
              //       title: 'Success',
              //       message: 'Place added successfully',
              //     );
              //     Future.delayed(Duration(milliseconds: 100), () {
              //       if (context.router.canPop()) {
              //         context.router.pop();
              //       }
              //     }
              //     );
              //
              //   });
              // }

              // if (state.isPlaceAdded) {
              //   WidgetsBinding.instance.addPostFrameCallback((_) {
              //     if (context.router.canPop()) {
              //       context.router.pop();
              //     }
              //   });
              //
              //   setState(() {
              //     pizzaPlace = '';
              //     street = '';
              //     city = '';
              //
              //     zip = '';
              //     phone = '';
              //     socialLink = '';
              //     mapLink = '';
              //     selectedLocation = null;
              //     hoursOpen = {};
              //   });
              //
              //   // _locationController.clear();
              //   // _streetController.clear();
              // }
              print(state);
            },
            child: Dialog(
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Adjust corner radius
                ),
                child: BlocBuilder<DiscoverBloc, DiscoverState>(
                    builder: (context, state) {
                  return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                          child: Stack(children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Add a Pizza Place",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1)),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    pizzaPlace = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Place Name',
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1)),
                              child: TextField(
                                controller: _streetController,
                                onChanged: (value) {
                                  if (value.isEmpty) {

                                    _discoverBloc.add(const DiscoverSearchLocations(''));
                                    setState(() {});
                                  } else {
                                    _discoverBloc.add(DiscoverSearchLocations(value));
                                  }
                                  setState(() {
                                    street = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Address',
                                    border: InputBorder.none),
                              ),
                            ),

                            const SizedBox(height: 16),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(
                            //           color: AppColors.grey2, width: 1)),
                            //   child: TextField(
                            //     controller: cityController,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         city = value;
                            //       });
                            //     },
                            //     decoration: const InputDecoration(
                            //         hintText: 'Enter City',
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                            // const SizedBox(height: 16),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(
                            //           color: AppColors.grey2, width: 1)),
                            //   child: TextField(
                            //     onChanged: (value) {
                            //       setState(() {
                            //         state = value;
                            //       });
                            //     },
                            //     decoration: const InputDecoration(
                            //         hintText: 'Enter State',
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                            // const SizedBox(height: 16),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       border: Border.all(
                            //           color: AppColors.grey2, width: 1)),
                            //   child: TextField(
                            //     controller: zipController,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         zip = value;
                            //       });
                            //       getLatLngFromAddress('$street, $city, $zip');
                            //     },
                            //     keyboardType: TextInputType.number,
                            //     decoration: const InputDecoration(
                            //       hintText: 'Enter Zip Code',
                            //       border: InputBorder.none,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: _showHoursBottomSheet,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        hoursOpen.isNotEmpty &&
                                                hoursOpen.values.any((hours) =>
                                                    hours != 'Closed')
                                            ? 'Hours Selected'
                                            : 'Select Business Hours',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.grey2, width: 1)),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    phone = value;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Phone',
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.grey2, width: 1),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    socialLink = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter Social Media Link',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.grey2, width: 1),
                              ),
                              child: TextField(
                                // onChanged: (value) {
                                //   setState(() {
                                //     mapLink = value;
                                //   });
                                // },
                                controller:
                                    TextEditingController(text: state.mapLink),
                                readOnly: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Map Link',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Align(
                              child: Text("Location"),
                              alignment: Alignment.centerLeft,
                            ),
                            const SizedBox(height: 10),
                            MapLocationPicker(
                              onLocationSelected: (LatLng location) {
                                setState(() {
                                  selectedLocation = location;
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            const Align(
                              child: Text("Photos"),
                              alignment: Alignment.centerLeft,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                                height: 200,
                                child: BlocBuilder<DiscoverBloc, DiscoverState>(
                                    builder: (context, state) {
                                  return GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      // 4 columns
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    itemCount:
                                        _discoverBloc.state.images.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          _discoverBloc.state.images.length) {
                                        // Add new item button
                                        return GestureDetector(
                                          onTap: () {
                                            _addNewItem();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Icon(Icons.add,
                                                size: 40,
                                                color: Colors.grey[700]),
                                          ),
                                        );
                                      }

                                      final image =
                                          _discoverBloc.state.images[index];
                                      return GestureDetector(
                                        onTap: () {
                                          _pickImage(index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: image != null
                                                ? DecorationImage(
                                                    image: FileImage(image),
                                                    fit: BoxFit.cover)
                                                : null,
                                          ),
                                          child: image == null
                                              ? Icon(Icons.upload,
                                                  size: 40,
                                                  color: Colors.grey[700])
                                              : null,
                                        ),
                                      );
                                    },
                                  );
                                })),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                        color: AppColors.grey2,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.lightOrange,
                                            width: 1)),
                                    child: const Center(
                                        child: Text(
                                      'Cancel',
                                      style: TextStyle(color: AppColors.black),
                                    )),
                                  ),
                                ),
                                Spacer(),
                                BlocBuilder<DiscoverBloc, DiscoverState>(
                                  builder: (context, blocState) {
                                    return GestureDetector(
                                      onTap: blocState.isAddingPlace
                                          ? null
                                          : () {
                                        // if (blocState.images.isEmpty) {
                                        //   widget.alertManager.showValidation(
                                        //     title: 'Validation',
                                        //     message: 'Please add at least one image.',
                                        //   );
                                        //   return;
                                        // }
                                              final days = [
                                                "sunday",
                                                "monday",
                                                "tuesday",
                                                "wednesday",
                                                "thursday",
                                                "friday",
                                                "saturday"
                                              ];

                                              for (var day in days) {
                                                if (!hoursOpen
                                                        .containsKey(day) ||
                                                    hoursOpen[day]!.isEmpty) {
                                                  hoursOpen[day] = "closed";
                                                }
                                              }
                                              Map<String, dynamic> data = {
                                                'name': pizzaPlace,
                                                'address[street]': street,
                                                'address[city]': city,
                                                'address[zip]': zip,
                                               // 'address[state]': state,
                                                'phone': phone,
                                                'hoursOpen': hoursOpen,
                                                'Links[social]': socialLink,
                                                'Links[maps]': mapLink,
                                                'photos': "",
                                                'location': {
                                                  'type': 'Point',
                                                  'coordinates':
                                                      selectedLocation != null
                                                          ? [
                                                              selectedLocation!
                                                                  .longitude,
                                                              selectedLocation!
                                                                  .latitude
                                                            ]
                                                          : null,
                                                }
                                              };
                                              print(
                                                  'Submitting form with ${_discoverBloc.state.images.length} images');
                                              _discoverBloc
                                                  .add(DiscoverAddPlace(data));
                                            },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                3,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: AppColors.main,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.lightOrange,
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: blocState
                                                  .isAddingPlace // use blocState here too
                                              ? const SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            AppColors.white),
                                                  ),
                                                )
                                              : const Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                      color: AppColors.white),
                                                ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),


                          BlocBuilder<DiscoverBloc, DiscoverState>(
                            builder:(context,state){

                              if (_streetController.text.isNotEmpty && _discoverBloc.state.locationSuggestions.isNotEmpty)
                              {
                                return  Positioned(
                                  top: 158,
                                  // Adjust this value based on your layout
                                  left: 0,
                                  right: 0,
                                  // right: MediaQuery.of(context).size.width * .45,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                      MediaQuery.of(context).size.height * 0.3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: _discoverBloc
                                          .state.locationSuggestions.length,
                                      itemBuilder: (context, index) {
                                        final suggestion = _discoverBloc
                                            .state.locationSuggestions[index];
                                        return ListTile(
                                          title: Text(suggestion.mainText),
                                          subtitle: Text(suggestion.secondaryText),
                                          onTap: () {
                                            _discoverBloc.add(FetchPlaceDetails(
                                                suggestion.placeId));

                                            _streetController.text = suggestion.description;
                                            // Secondary text format is usually "City, State, Country"
                                            final addressParts =
                                            suggestion.secondaryText.split(',');
                                            if (addressParts.isNotEmpty) {
                                              final cityName = addressParts[0].trim();



                                              setState(() {
                                                print('tapped on location');
                                                print('city name = $cityName');
                                                city = cityName;
                                                street=suggestion.mainText;
                                                _streetController.text =
                                                    suggestion.description;
                                                _discoverBloc.add(
                                                    const DiscoverSearchLocations(
                                                        ''));
                                              });
                                            }

                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );


                              }
                              return const SizedBox.shrink();
                            }
                          )

                      ])));
                })));
      },
    );
  }

  void _showHoursBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Business Hours',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        'Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday'
                      ].map((day) {
                        final hours = hoursOpen[day.toLowerCase()] ?? 'Closed';

                        return ListTile(
                          title: Text(day),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(hours),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _showTimePickerDialog(day, setModalState),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.cancel, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    hoursOpen[day.toLowerCase()] = 'Closed';
                                  });
                                  setModalState(() {});
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {}); // Refresh the main UI when bottom sheet is closed
    });
  }

  void _showTimePickerDialog(
      String day, void Function(void Function()) setModalState) async {
    // Simple time picker for new places - no need to handle existing times
    TimeOfDay? openTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 0), // Default opening time
    );

    if (openTime != null) {
      TimeOfDay? closeTime = await showTimePicker(
        context: context,
        initialTime:
            const TimeOfDay(hour: 21, minute: 0), // Default closing time
      );

      if (closeTime != null) {
        setState(() {
          hoursOpen[day.toLowerCase()] =
              '${openTime.format(context)} - ${closeTime.format(context)}';
        });
        setModalState(() {}); // Refresh the bottom sheet UI
      }
    }
  }

  Future<void> getLatLngFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        final latLng = LatLng(location.latitude, location.longitude);
        setState(() {
          selectedLocation = latLng;
        });

        double latitude = location.latitude;
        double longitude = location.longitude;

        print("Latitude: $latitude");
        print("Longitude: $longitude");
        _discoverBloc.add(DiscoverEvent.updateMapLocation(latLng));
      }
    } catch (e) {
      print("Error: $e");
    }
  }

}
