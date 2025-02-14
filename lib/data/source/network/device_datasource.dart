import 'package:pizzajournals/data/source/network/api_path.dart';
import 'package:pizzajournals/data/source/network/api_response_extensions.dart';
import 'package:pizzajournals/data/source/network/models/data_item.dart';
import 'package:pizzajournals/data/source/network/models/device_model.dart';
import 'package:pizzajournals/data/source/network/models/unseen_notification_count_model.dart';
import 'package:pizzajournals/data/source/network/network.dart';
import 'package:pizzajournals/utils/extensions/map_extensions.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeviceDataSource {
  final NetworkManager _networkManager;

  const DeviceDataSource({
    required NetworkManager networkManager,
  }) : _networkManager = networkManager;

  Future<DeviceModel> getInfo({
    required String uuid,
    required String userAgent,
    required String timezone,
    String? userId,
    String? countryCode,
  }) async {
    try {
      Map<String, dynamic> data = {
        'uuid': uuid,
        'user_agent': userAgent,
        'tz': timezone,
      };
      data.writeIfNotNull(key: 'user_id', value: userId);
      data.writeIfNotEmpty(key: 'cc', value: countryCode ?? '');

      final response = await _networkManager.request(
        RequestMethod.get,
        ApiPath.deviceInfoPath,
        data: data,
      );

      return DeviceModel.fromJson(response.responseData);
    } catch (_) {
      rethrow;
    }
  }

  Future<String> updateToken({
    required String uuid,
    required String token,
    String? userId,
  }) async {
    try {
      Map<String, dynamic> data = {
        'uuid': uuid,
        'token': token,
      };
      data.writeIfNotNull(key: 'user_id', value: userId);

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.deviceUpdateTokenPath,
        data: data,
      );
      final dataItem = DataItem<String>.fromJson(
        response.responseData,
        (json) => '$json',
        dataJsonKeyName: 'new_token',
      );

      return dataItem.data ?? '';
    } catch (_) {
      rethrow;
    }
  }

  Future<UnseenNotificationCountModel?> login({
    required String userId,
    required String uuid,
  }) async {
    try {
      Map<String, dynamic> data = {
        'user_id': userId,
        'uuid': uuid,
      };

      final response = await _networkManager.request(
        RequestMethod.post,
        ApiPath.deviceLoginPath,
        data: data,
      );
      final dataItem = DataItem<UnseenNotificationCountModel>.fromJson(
        response.responseData,
        UnseenNotificationCountModel.fromJsonModel,
        dataJsonKeyName: 'unseen_pn_count',
      );

      return dataItem.data;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logout({
    required String userId,
    required String uuid,
  }) async {
    try {
      Map<String, dynamic> data = {
        'user_id': userId,
        'uuid': uuid,
      };

      await _networkManager.request(
        RequestMethod.post,
        ApiPath.deviceLogoutPath,
        data: data,
      );
    } catch (_) {
      rethrow;
    }
  }
}
