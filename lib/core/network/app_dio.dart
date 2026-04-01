import 'package:dio/dio.dart';
import 'package:dio_curl_logger/dio_curl_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppNetworkModule {
  @singleton
  Dio provideDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(
      CurlLoggingInterceptor(
        showRequestLog:
            true, // Set to false to disable logging of HTTP requests
        showResponseLog:
            false, // Set to false to disable logging of HTTP responses
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  }
}
