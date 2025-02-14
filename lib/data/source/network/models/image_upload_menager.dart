import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String baseUrl = 'https://pizzajournals.com';
  static const String apiVersion = '/api/v1/';

  static String get apiBaseUrl => baseUrl + apiVersion;
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final ErrorType type;

  ApiException({
    required this.message,
    this.statusCode,
    this.type = ErrorType.unknown,
  });
}

// Error types for better error handling
enum ErrorType {
  network,
  auth,
  server,
  unknown,
}

class ApiResponse {
  final int statusCode;
  final dynamic data;

  ApiResponse({
    required this.statusCode,
    required this.data,
  });
}

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  final Dio _dio;

  ApiClient._internal()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.apiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          // Increased timeout
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          responseType: ResponseType.json,
          validateStatus: (status) => status! < 500,
        )) {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    _dio.interceptors.clear();

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
  }

  Future<ApiResponse> post(String path,
      {dynamic data, Options? options}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: options,
      );

      return ApiResponse(
        statusCode: response.statusCode ?? 500,
        data: response.data,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw ApiException(
        message: 'No internet connection',
        type: ErrorType.network,
      );
    } catch (e) {
      throw ApiException(
        message: 'An unexpected error occurred',
        type: ErrorType.unknown,
      );
    }
  }

  ApiException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'No internet connection',
          type: ErrorType.network,
          statusCode: 0,
        );

      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection',
          type: ErrorType.network,
          statusCode: 0,
        );

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        switch (statusCode) {
          case 401:
            return ApiException(
              message: responseData?['message'] ?? 'Invalid credentials',
              statusCode: statusCode,
              type: ErrorType.auth,
            );
          case 403:
            return ApiException(
              message: responseData?['message'] ?? 'Access denied',
              statusCode: statusCode,
              type: ErrorType.auth,
            );
          case 404:
            return ApiException(
              message: responseData?['message'] ?? 'Resource not found',
              statusCode: statusCode,
              type: ErrorType.server,
            );
          default:
            return ApiException(
              message: responseData?['message'] ?? 'Server error occurred',
              statusCode: statusCode,
              type: ErrorType.server,
            );
        }

      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request cancelled',
          type: ErrorType.unknown,
        );

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return ApiException(
            message: 'No internet connection',
            type: ErrorType.network,
          );
        }
        return ApiException(
          message: 'An unexpected error occurred',
          type: ErrorType.unknown,
        );

      default:
        return ApiException(
          message: 'An unexpected error occurred',
          type: ErrorType.unknown,
        );
    }
  }
}
