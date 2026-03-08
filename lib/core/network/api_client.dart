import 'package:dio/dio.dart';

Dio createDioClient() {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.jikan.moe/v4',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
