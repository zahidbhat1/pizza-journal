import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';

part 'discover_event.freezed.dart';

@freezed
class DiscoverEvent with _$DiscoverEvent {
  const factory DiscoverEvent.load(Map<String, String>? request) = DiscoverLoad;

  const factory DiscoverEvent.loadUserPlaces() = DiscoverLoadUserPlaces;

  const factory DiscoverEvent.refresh() = DiscoverRefresh;

  const factory DiscoverEvent.pizzaPlace(PizzaPlaceModel pizzaPlaceModel) =
      DiscoverPizzaPlace;

  const factory DiscoverEvent.pizzaPlaceReviews(
      PizzaPlaceModel? pizzaPlaceModel) = DiscoverPizzaPlaceReviews;

  const factory DiscoverEvent.addImage(File image, int index) =
      DiscoverAddImage;

  const factory DiscoverEvent.addPizzaPlace(Map<String, dynamic> data) =
      DiscoverAddPlace;

  const factory DiscoverEvent.addPizzaPlaceReview(Map<String, dynamic> data) =
      DiscoverAddPlaceReview;

  const factory DiscoverEvent.suggestEdit(PizzaPlaceModel pizzaPlace) =
      DiscoverSuggestEdit;

  const factory DiscoverEvent.updateMapLocation(LatLng location) =
      UpdateMapLocation;
  const factory DiscoverEvent.fetchPlaceDetails(String placeId) = FetchPlaceDetails;
  const factory DiscoverEvent.selectPizzaType(String pizzaType) = DiscoverSelectPizzaType;

  const factory DiscoverEvent.submitEdit({
    required Map<String, dynamic> data,
  }) = DiscoverSubmitEdit;

  const factory DiscoverEvent.searchLocations(String query) =
      DiscoverSearchLocations;

  const factory DiscoverEvent.locationSelected({
    required String street,
    required String pincode,
    required String city,
    required String state,
    required String country,
  }) = LocationSelected;

  const factory DiscoverEvent.fetchLocationFromPincode(String pincode) =
      DiscoverFetchLocationFromPincode;
}
