import '../data/source/error/app_exception.dart';

String getErrorMessage(ServerException error) {
  switch (error.type) {
    case ServerExceptionType.noInternet:
      return 'No internet connection. Please check your network and try again.';
    case ServerExceptionType.timeOut:
      return 'The request timed out. Please try again later.';
    case ServerExceptionType.unauthorized:
      return 'You are not authorized to perform this action. Please log in again.';
    case ServerExceptionType.forbidden:
      return 'You do not have permission to access this resource.';
    case ServerExceptionType.notFound:
      return 'The requested resource was not found.';
    case ServerExceptionType.internal:
      return 'An internal server error occurred. Please try again later.';
    case ServerExceptionType.serviceUnavailable:
      return 'The service is currently unavailable. Please try again later.';

    case ServerExceptionType.unknown:
      return 'An unexpected error occurred. Please try again.';
    default:
      return error.message.isNotEmpty ? error.message : 'An error occurred.';
  }
}