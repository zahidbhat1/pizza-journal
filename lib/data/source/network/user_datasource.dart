import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:pizzajournals/data/source/network/api_path.dart';
import 'package:pizzajournals/data/source/network/api_response_extensions.dart';
import 'package:pizzajournals/data/source/network/models/data_item.dart';
import 'package:pizzajournals/data/source/network/models/data_list.dart';
import 'package:pizzajournals/data/source/network/models/login_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';
import 'package:pizzajournals/data/source/network/network.dart';
import 'package:pizzajournals/utils/extensions/map_extensions.dart';

import 'models/place_suggestion.dart';
import 'models/place_suggestion_model.dart';

@singleton
class UserDataSource {
  final NetworkManager _networkManager;

  const UserDataSource({
    required NetworkManager networkManager,
  }) : _networkManager = networkManager;

  Future<LoginModel?> getAccessToken({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.userAccessTokenPath,
        data: data,
      );
      final dataItem = DataItem<LoginModel>.fromJson(
        response.responseData,
        LoginModel.fromJsonModel,
        dataJsonKeyName: 'data',
      );

      print(dataItem);
      return dataItem.data;
    } catch (_) {
      rethrow;
    }
  }

  Future<LatLng?> getLocationFromPincode(String pincode) async {
    try {
      final response = await Dio().get(
        'https://maps.googleapis.com/maps/api/geocode/json',
        queryParameters: {
          "address": pincode,
          "components": "country:IN",
          "key": 'AIzaSyCfdv9Fo_Mxst5ASKrWXGh74YTskTlsHZ4',
        },
      );

      if (response.statusCode == 200 && response.data['status'] == 'OK') {
        final location = response.data['results'][0]['geometry']['location'];
        print('location from the userdata source $location');
        print('Full response: ${response.data}');

        return LatLng(location['lat'], location['lng']);
      }
    } catch (e) {
      print("Error fetching location: $e");
    }
    return null;
  }

  Future<void> approveSuggestion(String suggestionId) async {
    try {
      await _networkManager.request(
        RequestMethod.patch,
        ApiPath.approveSuggestion,
        data: {'suggestion_id': suggestionId},
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> rejectSuggestion(String suggestionId) async {
    try {
      await _networkManager.request(
        RequestMethod.delete,
        ApiPath.rejectSuggestion,
        data: {'suggestion_id': suggestionId},
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<PlaceSuggestionsResponse> getSuggestions(String pizzaPlaceId) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        '${ApiPath.suggestions}/$pizzaPlaceId',
      );

      return PlaceSuggestionsResponse.fromJson(response.responseData);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<LocationSuggestions>> getLocationSuggestionss(
      String query) async {
    final input = Uri.encodeComponent(query);
    try {
      // final response = await _networkManager.requestAddress(
      //   RequestMethod.get,
      //   'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyCfdv9Fo_Mxst5ASKrWXGh74YTskTlsHZ4&input=$input',
      // );
      //
      // if (response.data['status'] == 'OK') {
      //   final predictions = response.data['predictions'] as List;
      //   return predictions
      //       .map((prediction) => LocationSuggestions.fromJson(prediction))
      //       .toList();
      // }
      try {
        final response = await Dio().get(
            'https://maps.googleapis.com/maps/api/place/autocomplete/json',
            queryParameters: {
              "input": input,
              "key": 'AIzaSyCfdv9Fo_Mxst5ASKrWXGh74YTskTlsHZ4',
            });

        if (response.statusCode == 200) {
          print(response.data);
          final predictions = response.data['predictions'] as List;
          print(predictions);
          return predictions
              .map((prediction) => LocationSuggestions.fromJson(prediction))
              .toList();
        } else {
          print("Error: ${response.statusCode}, ${response.data}");
        }
      } catch (e) {
        print("Dio error: $e");
      }
      return [];
    } catch (_) {
      rethrow;
    }
  }

  Future<DataItem<dynamic>> editPizzaPlace({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.suggestEdit,
        data: data,
      );

      return DataItem<dynamic>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: 'data',
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<DataItem<UserModel>> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.patch,
        ApiPath.userMePath,
        data: data,
      );

      if (response.data['status'] == 'Success') {
        print(response.data);

        // Extract 'updatedMe' from response before parsing
        final updatedUserData =
            response.data['updatedMe'] as Map<String, dynamic>;

        return DataItem<UserModel>(
          success: true,
          data: UserModel.fromJson(updatedUserData),
          // Fix: Pass correct JSON object
          code: response.statusCode?.toString() ?? '200',
          status: 'Success',
          message: 'Profile updated successfully',
        );
      }

      throw Exception(response.data['message']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPizzaPlace({
    required Map<String, dynamic> data,
    required List<File?> files,
  }) async {
    try {
      final response = await _networkManager
          .request(RequestMethod.post, ApiPath.pizzaPlaces, data: data);
      // final dataItem = DataItem<LoginModel>.fromJson(
      //   response.responseData,
      //   LoginModel.fromJsonModel,
      //   dataJsonKeyName: 'data',
      // );

      print(response.responseData);
      // return dataItem.data;
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> validateRegister({
    required String email,
    required String name,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'screenName': name,
        'password': password,
        'passwordConfirm': passwordConfirm,
      };

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.userRegisterPath,
        data: data,
      );
      final dataItem = DataItem<dynamic>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: '',
      );

      return dataItem.code == '200';
    } catch (_) {
      rethrow;
    }
  }

  Future<DataItem<List<String>>> uploadPhotos(
      {required List<File?> files}) async {
    try {
      FormData formData = FormData();

      print("Starting to process ${files.length} files for upload");

      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (file != null && await file.exists()) {
          print("Processing file: ${file.path}");
          String fileName = basename(file.path);
          String extension = fileName.split('.').last.toLowerCase();

          var multipartFile = await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: MediaType('image', extension),
          );

          formData.files.add(MapEntry('photos', multipartFile));
        }
      }

      print("Sending ${formData.files.length} files to server");

      final response = await Dio().post(
        'https://pizzajournals.com/api/v1/uploads',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzlhMDZmNzNhYWY2YjEzNWFiMzM2MTUiLCJpYXQiOjE3Mzg1NjYzMDEsImV4cCI6MTc0MTE1ODMwMX0.3GDhAQRW-idCx_IA8k_V2pEEZkrjdxL2refofMhFaxY',
          },
        ),
      );

      print('Server Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> responseData = response.data;

        if (responseData['status'] == 'success' &&
            responseData['data'] is List) {
          final List<String> urls = (responseData['data'] as List)
              .map((item) => item.toString())
              .toList();

          return DataItem<List<String>>(
            success: true,
            data: urls,
            code: '200',
            message: 'Photos uploaded successfully',
            status: 'success',
          );
        }
      }

      throw Exception('Invalid response format from server');
    } catch (e, stackTrace) {
      print('Upload error details:');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<DataList<PizzaPlaceModel>> getPizzaPlaces(
      {required Map<String, dynamic> query}) async {
    try {
      final response = await _networkManager.request(
          RequestMethod.get, ApiPath.searchPlaces,
          queryParameters: query);
      var data = DataList<PizzaPlaceModel>.fromJson(
        response.responseData,
        PizzaPlaceModel.fromJsonModel,
        dataJsonKeyName: 'data',
      );
      print("=====");
      print(data);
      print("=====");
      return data;
    } catch (_) {
      return DataList(data: []);
      rethrow;
    }
  }

  Future<DataList<PizzaPlaceModel>> getUserPizzaPlaces() async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.userPlaces,
      );

      var data = DataList<PizzaPlaceModel>.fromJson(
        response.responseData,
        PizzaPlaceModel.fromJsonModel,
        dataJsonKeyName: 'data',
      );

      print("=====");
      print(data);
      print("=====");

      return data;
    } catch (_) {
      return DataList(data: []);
      rethrow;
    }
  }

  // Future<UserModel?> register({
  //   required String registerMethod,
  //   required String displayName,
  //   String? email,
  //   String? password,
  //   String? gender,
  // }) async {
  //   try {
  //     Map<String, dynamic> data = {};
  //     data.writeIfNotEmpty(key: 'register_method', value: registerMethod);
  //     data.writeIfNotEmpty(key: 'display_name', value: displayName);
  //     data.writeIfNotEmpty(key: 'email', value: email);
  //     data.writeIfNotEmpty(key: 'password', value: password);
  //     data.writeIfNotEmpty(key: 'gender', value: gender);
  //
  //     final response = await _networkManager.request(
  //       RequestMethod.post,
  //       ApiPath.userRegisterPath,
  //       data: data,
  //     );
  //     final dataItem = DataItem<UserModel>.fromJson(
  //       response.responseData,
  //       UserModel.fromJsonModel,
  //       dataJsonKeyName: 'user',
  //     );
  //
  //     return dataItem.data;
  //   } catch (_) {
  //     rethrow;
  //   }
  // }

  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotEmpty(key: 'email', value: email);

      await _networkManager.request(
        RequestMethod.post,
        ApiPath.userResetPasswordPath,
        data: data,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel> getUserMe() async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.userMePath,
      );

      return UserModel.fromJson(response.responseData['me']);
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel> showUser({
    required int userId,
  }) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.userShowPath(userId: userId),
      );

      return UserModel.fromJson(response.responseData);
    } catch (_) {
      rethrow;
    }
  }

  Future<PizzaReviewModel> getPizzaPlaceReviews({
    required String placeId,
  }) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.pizzaPlaceReviews + placeId,
      );
      return PizzaReviewModel.fromJson(response.responseData["data"]);
    } catch (_) {
      rethrow;
    }
  }

  Future<DataItem<dynamic>> addPizzaPlaceReview(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.post,
        data: data,
        ApiPath.addPizzaPlaceReview,
      );

      var res = DataItem<dynamic>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: '',
      );
      print(res);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<DataList<UserModel>> getSuggestedUsers({
    required int userId,
  }) async {
    try {
      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.userSuggestedPath(userId: userId),
      );

      return DataList<UserModel>.fromJson(
        response.responseData,
        UserModel.fromJsonModel,
        dataJsonKeyName: 'users',
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<DataList<UserModel>> getSearchedUsers(
      {required int userId, required String query}) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'user_id', value: userId);
      data.writeIfNotNull(key: 'query', value: query);

      final response = await _networkManager
          .request(RequestMethod.get, ApiPath.userSearchedPath, data: data);

      return DataList<UserModel>.fromJson(
        response.responseData,
        UserModel.fromJsonModel,
        dataJsonKeyName: 'users',
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<DataList<UserModel>> getSocialFriends({
    required int userId,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'medium', value: 'facebook');

      final response = await _networkManager.request(
          RequestMethod.get, ApiPath.userSocialFriendsPath(userId: userId),
          data: data);

      return DataList<UserModel>.fromJson(
        response.responseData,
        UserModel.fromJsonModel,
        dataJsonKeyName: 'users',
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> followUser({
    required int userId,
    required int friendId,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'user_id', value: userId);
      data.writeIfNotNull(key: 'friend_id', value: friendId);

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.userFollowPath,
        data: data,
      );
      final dataItem = DataItem<dynamic>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: '',
      );

      return dataItem.code == '200';
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> unfollowUser({
    required int userId,
    required int friendId,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'user_id', value: userId);
      data.writeIfNotNull(key: 'friend_id', value: friendId);

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.userUnfollowPath,
        data: data,
      );
      final dataItem = DataItem<dynamic>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: '',
      );

      return dataItem.code == '200';
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel?> edit({
    required String id,
    String? displayName,
    String? countryCode,
    String? currentCountryCode,
    String? selfIntroduction,
    String? birthday,
    String? religion,
    String? gender,
    String? firstName,
    String? lastName,
    String? profilePicture,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'id', value: id);
      data.writeIfNotEmpty(key: 'display_name', value: displayName);
      data.writeIfNotEmpty(key: 'country_code', value: countryCode);
      data.writeIfNotEmpty(
          key: 'current_country_code', value: currentCountryCode);
      data.writeIfNotEmpty(key: 'self_introduction', value: selfIntroduction);
      data.writeIfNotEmpty(key: 'birthday', value: birthday);
      data.writeIfNotEmpty(key: 'religion', value: religion);
      data.writeIfNotEmpty(key: 'gender', value: gender);
      data.writeIfNotEmpty(key: 'first_name', value: firstName);
      data.writeIfNotEmpty(key: 'last_name', value: lastName);
      data.writeIfNotEmpty(key: 'profile_picture', value: profilePicture);

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.userEditPath,
        data: data,
      );
      final dataItem = DataItem<UserModel>.fromJson(
        response.responseData,
        UserModel.fromJsonModel,
        dataJsonKeyName: 'user',
      );

      return dataItem.data;
    } catch (_) {
      rethrow;
    }
  }

  Future<DataList<UserModel>> getRankingUsers({
    int? userId,
    String? selectedCountry,
    String? period,
  }) async {
    try {
      Map<String, dynamic> data = {};
      data.writeIfNotNull(key: 'app_user_id', value: userId);
      data.writeIfNotEmpty(key: 'selected_country', value: selectedCountry);
      data.writeIfNotEmpty(key: 'period', value: period);

      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.userRankingPath,
        data: data,
      );

      return DataList<UserModel>.fromJson(
        response.responseData,
        UserModel.fromJsonModel,
        dataJsonKeyName: 'data',
      );
    } catch (_) {
      rethrow;
    }
  }
}
