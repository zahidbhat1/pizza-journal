import 'package:dio/dio.dart';
import 'package:pizzajournals/data/source/network/api_config.dart';

class ContentTypeInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.data is FormData) {
      options.headers[ApiConfig.contentTypeHeaderKey] = ApiConfig.contentTypeMultipartFormData;
    } else {
      options.headers[ApiConfig.contentTypeHeaderKey] =
          ApiConfig.contentTypeApplicationFormUrlEncoded;
    }

    return handler.next(options);
  }
}
