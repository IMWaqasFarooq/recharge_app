import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final resourcePath = _jsonDir + options.path + _jsonExtension;

      final data = await rootBundle.loadString(resourcePath);

      final map = json.decode(data);

      handler.resolve(
        Response(
          requestOptions: options,
          data: map,
          statusCode: 200,
        ),
      );
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Mock data not found for ${options.path}',
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}