import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzajournals/data/source/network/models/data_item.dart';
import 'package:pizzajournals/data/source/network/models/data_list.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';
import 'package:pizzajournals/data/source/network/models/register_data.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

import '../source/network/models/place_suggestion.dart';
import '../source/network/models/place_suggestion_model.dart';

abstract class UserRepository {
  const UserRepository();

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<List<PlaceSuggestion>> getSuggestions(String pizzaPlaceId);

  Future<LatLng?> getLocationFromPincode(String pincode);

  Future<DataItem<UserModel>> updateProfile(Map<String, dynamic> data);

  Future<void> addPizzaPlace({
    required Map<String, dynamic> data,
    required List<File?> files,
  });

  Future<DataItem<List<String>>> uploadPhotos({
    required List<File?> files,
  });

  Future<void> approveSuggestion(String suggestionId);

  Future<void> rejectSuggestion(String suggestionId);

  Future<List<LocationSuggestions>> getLocationSuggestionss(String query);

  Future<DataItem<dynamic>> editPizzaPlace({
    required Map<String, dynamic> data,
  });

  Future<DataItem<void>> addPizzaPlaceReview(
      {required Map<String, dynamic> data});

  Future<void> logout();

  Future<DataList<PizzaPlaceModel>> getPizzaPlaces(
      Map<String, String>? request);

  Future<DataList<PizzaPlaceModel>> getUserPizzaPlaces();

  Future<PizzaReviewModel> getPizzaPlaceReviews({required String placeId});

  Future<void> validateUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  });

  Future<void> validateDisplayName({
    required String displayName,
  });

  Future<UserModel> register({
    required RegisterData data,
  });

  Future<UserModel?> getLocalUser();

  Future<UserModel> getUser();

  Future<void> forgotPassword({
    required String email,
  });

  Future<void> saveDeviceInfo();

  Future<void> saveDeviceToken({
    String? token,
  });

  Future<UserModel> showUser({required int userId});
}
