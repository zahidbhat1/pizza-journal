import 'package:dio/dio.dart';
import 'package:pizzajournals/data/source/error/app_exception.dart';

extension ApiResponseExtensions on Response {
  ServerException? get errorDataToServerException {
    try {
      final data = this.data;
      if (data is Map<String, dynamic>) {
        // First try to get the message from the top level
        if (data.containsKey('message') && data['message'] is String) {
          return ServerException(
            type: ServerExceptionType.general,
            message: data['message'] as String,
          );
        }

        // If not found at top level, try to extract from nested error structure
        if (data.containsKey('error') &&
            data['error'] is Map<String, dynamic>) {
          final error = data['error'] as Map<String, dynamic>;

          // Try to get from error.err.message
          if (error.containsKey('err') &&
              error['err'] is Map<String, dynamic>) {
            final err = error['err'] as Map<String, dynamic>;
            if (err.containsKey('message') && err['message'] is String) {
              return ServerException(
                type: ServerExceptionType.general,
                message: err['message'] as String,
              );
            }
          }

          // If we have a stack trace with error message
          if (error.containsKey('stack') && error['stack'] is String) {
            final stack = error['stack'] as String;
            // Try to extract message from stack if it contains "Error: ..."
            final errorRegex = RegExp(r'Error: ([^\n]+)');
            final match = errorRegex.firstMatch(stack);
            if (match != null && match.groupCount >= 1) {
              return ServerException(
                type: ServerExceptionType.general,
                message: match.group(1) ?? 'Unknown error',
              );
            }
          }
        }
      }

      // Fallback for unexpected response format
      return ServerException(
        type: ServerExceptionType.unknown,
        message: 'Unknown server error',
      );
    } catch (e) {
      return ServerException(
        type: ServerExceptionType.unknown,
        message: 'Error parsing server response: $e',
      );
    }
  }
}

extension AppErrorExtension on Object {
  ServerException get errorToServerException {
    final error = this;

    if (error is DioException) {
      return error.dioToServerException;
    }

    return ServerException(
      type: ServerExceptionType.unknown,
      message: error.toString(),
    );
  }

  String get errorMessage {
    final error = this;
    if (error is ServerException) {
      return error.message;
    }
    return '$error';
  }
}

extension _DioErrorExtension on DioException {
  ServerException get dioToServerException {
    final statusCode = response?.statusCode;
    final exception = response?.errorDataToServerException;
    final message = exception?.message ?? error?.toString() ?? '';

    return switch (type) {
      DioExceptionType.badResponse => switch (statusCode) {
          400 => ServerException(
              type: ServerExceptionType.general,
              message: message,
              code: statusCode,
            ),
          401 => ServerException(
              type: ServerExceptionType.unauthorized,
              message: message,
              code: statusCode,
            ),
          403 => ServerException(
              type: ServerExceptionType.forbidden,
              message: message,
              code: statusCode,
            ),
          404 || 405 || 501 => ServerException(
              type: ServerExceptionType.notFound,
              message: message,
              code: statusCode,
            ),
          409 => ServerException(
              type: ServerExceptionType.conflict,
              message: message,
              code: statusCode,
            ),
          500 || 502 => ServerException(
              type: ServerExceptionType.internal,
              message: message,
              code: statusCode,
            ),
          503 => ServerException(
              type: ServerExceptionType.serviceUnavailable,
              message: message,
              code: statusCode,
            ),
          _ => ServerException(
              type: ServerExceptionType.unknown,
              message: message,
              code: statusCode,
            ),
        },
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        ServerException(
          type: ServerExceptionType.timeOut,
          message: message,
          code: 408,
        ),
      DioExceptionType.connectionError => ServerException(
          type: ServerExceptionType.noInternet,
          message: message,
          code: 101,
        ),
      DioExceptionType.badCertificate => ServerException(
          type: ServerExceptionType.unknown,
          message: message,
          code: statusCode,
        ),
      DioExceptionType.cancel || DioExceptionType.unknown => ServerException(
          type: ServerExceptionType.unknown,
          message: message,
          code: statusCode,
        ),
    };
  }
}
