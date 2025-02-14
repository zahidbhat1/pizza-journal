import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/source/network/api_response_extensions.dart';
import 'package:pizzajournals/data/source/network/extensions/app_error_extension.dart';

@singleton
class NetworkManager {
  final Dio _dio;

  const NetworkManager({
    required Dio dio,
  }) : _dio = dio;

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    void Function(int sent, int total)? onUploadProgress,
  }) async {
    try {
      // Initialize headers if null
      headers ??= {};

      // Special handling for multipart form data
      Options? requestOptions;
      if (data is FormData) {
        requestOptions = Options(
          contentType: Headers.multipartFormDataContentType,
          headers: headers,
          method: method.value,
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
        );

        // Log for debugging
        print('Uploading multipart form data');
        print('Number of files: ${data.files.length}');
        print('Fields: ${data.fields}');
      }

      print(url);
      return await _errorHandler(
        () async {
          return _dio.request<T>(
            url,
            data: data,
            queryParameters: queryParameters,
            options: requestOptions ??
                Options(
                  method: method.value,
                  headers: headers,
                  followRedirects: true,
                  validateStatus: (status) => status != null && status < 500,
                ),
            onSendProgress: onUploadProgress,
          );
        },
      );
    } catch (e) {
      print('Request error: $e');
      rethrow;
    }
  }

  Future<T> _errorHandler<T>(Future<T> Function() body) async {
    try {
      final response = await body();

      if (response is Response<T> && response.hasError) {
        final exception = response.errorDataToServerException;
        if (exception != null) {
          throw exception;
        }
      }
      return response;
    } catch (e) {
      print('Error handler caught: $e');
      final exception = e.errorToServerException;
      throw exception;
    }
  }

// Helper method to create multipart form data
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => name.toUpperCase();
}
