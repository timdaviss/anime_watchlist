import 'dart:async';

import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.baseDelay = const Duration(seconds: 1),
  });

  final Dio dio;
  final int maxRetries;
  final Duration baseDelay;

  static const Duration _minRequestInterval = Duration(milliseconds: 350);
  DateTime _lastRequestTime = DateTime.fromMillisecondsSinceEpoch(0);
  Future<void> _rateLimitQueue = Future<void>.value();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _rateLimitQueue = _rateLimitQueue.then((_) async {
      final now = DateTime.now();
      final elapsed = now.difference(_lastRequestTime);

      if (elapsed < _minRequestInterval) {
        await Future<void>.delayed(_minRequestInterval - elapsed);
      }

      _lastRequestTime = DateTime.now();
    });

    await _rateLimitQueue;
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final retryCount = err.requestOptions.extra['retryCount'] as int? ?? 0;

    if (retryCount >= maxRetries) {
      handler.next(err);
      return;
    }

    final shouldRetry =
        statusCode == 429 || (statusCode != null && statusCode >= 500);

    if (!shouldRetry) {
      handler.next(err);
      return;
    }

    final delay = baseDelay * (1 << retryCount);
    await Future<void>.delayed(delay);

    final requestOptions = err.requestOptions;
    requestOptions.extra['retryCount'] = retryCount + 1;

    try {
      final response = await dio.fetch<dynamic>(requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
