import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/source/error/app_exception.dart';
import 'package:pizzajournals/data/source/local/user_local_datasource.dart';
import 'package:pizzajournals/data/source/network/device_datasource.dart';
import 'package:pizzajournals/data/source/network/models/data_item.dart';
import 'package:pizzajournals/data/source/network/models/data_list.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';
import 'package:pizzajournals/data/source/network/models/register_data.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';
import 'package:pizzajournals/data/source/network/user_datasource.dart';
import 'package:pizzajournals/utils/app_devices.dart';
import 'package:pizzajournals/utils/extensions/future_extensions.dart';
import 'package:pizzajournals/utils/validator_utils.dart';

import '../source/network/models/place_suggestion.dart';
import '../source/network/models/place_suggestion_model.dart';

@Singleton(as: UserRepository)
class DefaultUserRepository extends UserRepository {
  final UserDataSource _userDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final DeviceDataSource _deviceDataSource;

  const DefaultUserRepository({
    required UserDataSource userDataSource,
    required UserLocalDataSource userLocalDataSource,
    required DeviceDataSource deviceDataSource,
  })  : _userDataSource = userDataSource,
        _userLocalDataSource = userLocalDataSource,
        _deviceDataSource = deviceDataSource;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final hashedPassword = password;

      final loginModel = await _userDataSource.getAccessToken(
        email: email,
        password: hashedPassword,
      );

      await _userLocalDataSource.saveAccessToken(loginModel?.token ?? '');

      final user = loginModel!.user;
      final userId = user?.id;
      await _userLocalDataSource.saveUser(user!);

      if (userId != null) {
        await saveDeviceAndToken(user: user).suppressError();
      }
      return user;
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  @override
  Future<LatLng?> getLocationFromPincode(String pincode) {
    return _userDataSource.getLocationFromPincode(pincode);
  }

  @override
  Future<List<PlaceSuggestion>> getSuggestions(String pizzaPlaceId) async {
    try {
      final response = await _userDataSource.getSuggestions(pizzaPlaceId);
      return response.data.suggestions; // Extracting the list
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> approveSuggestion(String suggestionId) async {
    try {
      await _userDataSource.approveSuggestion(suggestionId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> rejectSuggestion(String suggestionId) async {
    try {
      await _userDataSource.rejectSuggestion(suggestionId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DataItem<UserModel>> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _userDataSource.updateProfile(data);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> saveDeviceAndToken({
    required UserModel user,
  }) async {
    final userId = user.id;

    // if (userId != null) {
    //   final deviceId = await AppDevices.id;
    //   if (deviceId.isNotEmpty) {
    //     await _deviceDataSource
    //         .login(
    //           userId: userId,
    //           uuid: deviceId,
    //         )
    //         .suppressError();
    //     final notificationService = getIt<NotificationService>();
    //     final deviceToken = await notificationService.getToken();
    //     if (deviceToken.isNotEmpty) {
    //       await _deviceDataSource
    //           .updateToken(
    //             uuid: deviceId,
    //             token: deviceToken,
    //             userId: userId,
    //           )
    //           .suppressError();
    //     }
    //   }
    // }
  }

  @override
  Future<DataItem<List<String>>> uploadPhotos({
    required List<File?> files,
  }) async {
    try {
      final response = await _userDataSource.uploadPhotos(files: files);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      final user = await getLocalUser();
      final userId = user?.id;
      final deviceId = await AppDevices.id;

      await <Future<void>>[
        _userLocalDataSource.clearUserData(),
        if (userId != null && deviceId.isNotEmpty)
          _deviceDataSource.logout(
            userId: userId,
            uuid: deviceId,
          ),
      ].wait;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> validateUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    try {
      if (!ValidatorUtils.isEmailValid(email)) {
        throw AppException.serverException(
          type: ServerExceptionType.general,
          message: "errorInvalidEmailAddress",
        );
      }
      if (password != confirmPassword) {
        throw AppException.serverException(
          type: ServerExceptionType.general,
          message: "Invalid Password",
        );
      }

      final success = await _userDataSource.validateRegister(
        email: email,
        name: name,
        password: password,
        passwordConfirm: confirmPassword,
      );
      if (!success) {
        throw AppException.serverException(
          type: ServerExceptionType.general,
          message: "Error",
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DataItem<dynamic>> editPizzaPlace({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _userDataSource.editPizzaPlace(
        data: data,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> validateDisplayName({
    required String displayName,
  }) async {
    try {
      if (displayName.length >= 25) {
        throw AppException.serverException(
          type: ServerExceptionType.general,
          message: "Name Too Long",
        );
      }
      if (!ValidatorUtils.isNameValid(displayName)) {
        throw AppException.serverException(
          type: ServerExceptionType.general,
          message: "Unsupported Name",
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> register({
    required RegisterData data,
  }) async {
    try {
      UserModel? userModel;
      userModel = await login(
        email: data.email ?? '',
        password: data.password ?? '',
      );
      final user = userModel;
      final userId = user?.id;

      if (user != null && userId != null) {
        await <Future<void>>[
          _userDataSource.edit(
            id: userId,
            profilePicture: data.profilePicture,
          ),
        ].wait.suppressError();

        return user;
      }

      throw const AppException.serverException(
        type: ServerExceptionType.unauthorized,
        message: '',
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getLocalUser() async {
    try {
      final token = await _userLocalDataSource.getAccessToken();
      final userModel = await _userLocalDataSource.getUser();
      final user = userModel;

      if ((token?.isNotEmpty ?? false) && (user != null)) {
        return user;
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final userModel = await _userDataSource.getUserMe();
      await _userLocalDataSource.saveUser(userModel);
      final user = userModel;

      return user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<LocationSuggestions>> getLocationSuggestionss(
      String query) async {
    try {
      return await _userDataSource.getLocationSuggestionss(query);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      await _userDataSource.resetPassword(email: email);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveDeviceInfo() async {
    try {
      final user = await _userLocalDataSource.getUser();
      final userId = user?.id;
      final deviceId = await AppDevices.id;
      final deviceUserAgent = await AppDevices.userAgent;
      final timezone = await AppDevices.timezone;
      // TODO: Get country code from GPS
      final countryCode = '';

      if (deviceId.isNotEmpty) {
        await _deviceDataSource.getInfo(
          uuid: deviceId,
          userAgent: deviceUserAgent,
          timezone: timezone,
          userId: userId,
          countryCode: countryCode,
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveDeviceToken({
    String? token,
  }) async {
    try {
      final user = await _userLocalDataSource.getUser();
      final userId = user?.id;
      final deviceId = await AppDevices.id;
      // final notificationService = getIt<NotificationService>();
      // final deviceToken = token ?? await notificationService.getToken();

      // if (deviceId.isNotEmpty && deviceToken.isNotEmpty) {
      //   await _deviceDataSource.updateToken(
      //     uuid: deviceId,
      //     token: deviceToken,
      //     userId: userId,
      //   );
      // }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> addPizzaPlace({
    required Map<String, dynamic> data,
    required List<File?> files,
  }) async {
    try {
      await <Future<void>>[
        _userDataSource.addPizzaPlace(
          data: data,
          files: files,
        ),
      ].wait.suppressError();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> showUser({
    required int userId,
  }) async {
    try {
      return await _userDataSource.showUser(userId: userId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PizzaReviewModel> getPizzaPlaceReviews(
      {required String placeId}) async {
    try {
      final pizzaPlace =
          await _userDataSource.getPizzaPlaceReviews(placeId: placeId);
      return pizzaPlace;
      // return pizzaPlace;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DataItem<dynamic>> addPizzaPlaceReview(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await _userDataSource.addPizzaPlaceReview(data: data);

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DataList<PizzaPlaceModel>> getPizzaPlaces(
      Map<String, String>? request) async {
    try {
      final data = await _userDataSource.getPizzaPlaces(query: request ?? {});
      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<DataList<PizzaPlaceModel>> getUserPizzaPlaces() async {
    try {
      final data = await _userDataSource.getUserPizzaPlaces();
      return data;
    } catch (_) {
      rethrow;
    }
  }
}
