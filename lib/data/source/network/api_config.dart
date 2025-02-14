class ApiConfig {
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Authorization
  static const authorizationHeaderKey = 'Authorization';
  static const authorizationToken = 'Bearer';
  static const apiKey = 'key';

  // Content Type
  static const contentTypeHeaderKey = 'Content-Type';
  static const contentTypeApplicationFormUrlEncoded =
      'application/x-www-form-urlencoded';
  static const contentTypeMultipartFormData = 'multipart/form-data';
}
