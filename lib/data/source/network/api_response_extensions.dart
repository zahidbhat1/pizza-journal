import 'package:dio/dio.dart';
import 'package:pizzajournals/data/source/error/app_exception.dart';
import 'package:pizzajournals/data/source/network/models/error_data.dart';

extension ResponseExtension<T> on Response<T> {
  bool get hasError {
    if (data != null && data is Map<String, dynamic>) {
      final mapData = data as Map<String, dynamic>;
      final errorData = ErrorData.fromJson(mapData);
      return errorData.hasError;
    }
    return false;
  }

  ServerException? get errorDataToServerException {
    if (data != null && data is Map<String, dynamic>) {
      final mapData = data as Map<String, dynamic>;
      final errorData = ErrorData.fromJson(mapData);
      return ServerException(
        type: ServerExceptionType.general,
        message: errorData.errorMessage ?? '',
        code: statusCode,
      );
    }
    return null;
  }

  Map<String, dynamic>? get responseOptionalData {
    if (data != null) {
      if (data is Map<String, dynamic>) {
        return data as Map<String, dynamic>;
      } else if (data is List) {
        return {'data': data};
      }
    }
    return null;
  }

  Map<String, dynamic> get responseData {
    return responseOptionalData ?? {};
  }
}
