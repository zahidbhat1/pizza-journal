import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizzajournals/data/source/local/local_keys.dart';
import 'package:pizzajournals/data/source/network/api_config.dart';

class AuthorizationInterceptor extends QueuedInterceptor {
  final FlutterSecureStorage _storage;

  AuthorizationInterceptor({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _storage.read(key: LocalKeys.token);
      if (token?.isNotEmpty ?? false) {
        options.headers[ApiConfig.authorizationHeaderKey] =
            '${ApiConfig.authorizationToken} $token';
      }
      if (options.data is Map) {
        options.data = options.data..[ApiConfig.apiKey] = "key";
      } else {
        options.data = {
          ApiConfig.apiKey: "key",
        };
      }
    } catch (_) {}

    return handler.next(options);
  }
}
