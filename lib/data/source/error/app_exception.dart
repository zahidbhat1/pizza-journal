import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';
part 'server_exception_type.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.serverException({
    required ServerExceptionType type,
    required String message,
    int? code,
  }) = ServerException;
}
