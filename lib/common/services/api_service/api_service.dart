import 'package:sky_nest/common/services/api_service/api_urls.dart';

import 'app_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static ApiService? _singleton;

  static late Dio _dio;

  ApiService._() {
    _dio = createApiService();
  }

  factory ApiService() {
    return _singleton ??= ApiService._();
  }

  Dio get instance => _dio;

  Dio createApiService() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.ngrokServerUrl,
        connectTimeout: Duration(milliseconds: 16500),
        receiveTimeout: Duration(milliseconds: 16500),
        sendTimeout: Duration(milliseconds: 16500),
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json',
          'ngrok-skip-browser-warning': true,
        },
      ),
    );
    dio.interceptors.addAll([
      CustomDioInterceptor(),
      PrettyDioLogger(
        compact: true,
        error: true,
        maxWidth: 90,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    ]);
    return dio;
  }
}
