part of 'app_exception.dart';

enum ServerExceptionType {
  general,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  internal,
  serviceUnavailable,
  timeOut,
  noInternet,
  unknown;
}
