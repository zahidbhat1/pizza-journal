import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    debugPrint('🌍 Network Request Url [${options.method}]: ${options.baseUrl}${options.path}');
    debugPrint('🌍 Network Request Parameters: ${options.queryParameters}');
    debugPrint('🌍 Network Request Data: ${options.data}');
    debugPrint('🌍 Network Request Headers: ${options.headers}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
        '✅ Network Response Url [${response.requestOptions.method} ${response.statusCode}]: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    debugPrint('✅ Network Response: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    debugPrint(
        '❌ Error Url [${err.requestOptions.method} ${err.response?.statusCode}]: ${err.requestOptions.uri}');
    debugPrint('❌ Error: ${err.response?.data}');
    handler.next(err);
  }
}
