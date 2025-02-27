import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzajournals/data/source/network/models/data_item.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';

import '../../source/network/models/place_suggestion.dart';

part 'discover_state.freezed.dart';

enum DiscoverStateShopType {
  shop,
  recommended,
}
@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    String? email,
    @Default([]) List<PizzaPlaceModel> pizzaPlaces,
    @Default([]) List<PizzaPlaceModel> userPizzaPlaces,
    @Default([]) List<File?> images,
    @Default(null) PizzaReviewModel? reviews,
    @Default(null) Review? myReview,
    @Default(false) bool showLoading,
    @Default(false) bool isAddingPlace,
    @Default(false) bool isPlaceAdded,
    @Default('') String street,
    @Default('') String pincode,
    @Default('') String city,
    @Default('') String stateName,
    @Default('') String country,
    @Default('') String mapLink,
    LatLng? selectedMapLocation,
    @Default(null) PizzaPlaceModel? newlyAddedPlace,
    @Default(true) bool isMapInteractionEnabled, // Add @Default annotation here
    @Default(null) DataItem<void>? addReviewResponse,
    @Default([]) List<LocationSuggestions> locationSuggestions,
    @Default({}) Map<String, PizzaTypeSummary> summary, // Stores all pizza types summary
    @Default("Traditional Round") String selectedPizzaType, // Default to "Traditional Round"
    LatLng? fetchedLocation,
  }) = _DiscoverState;
}