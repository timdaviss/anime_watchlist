import 'package:dio/dio.dart';

import 'retry_interceptor.dart';

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.jikan.moe/v4',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.add(RetryInterceptor(dio: dio));

  return dio;
}
