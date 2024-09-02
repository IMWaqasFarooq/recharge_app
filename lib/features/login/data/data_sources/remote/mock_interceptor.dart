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
      print('Error loading mock data: $e');

      const String mockVerifiedUserData = '''{
      "id": 2,
       "name": "John Doe",
       "balance": 5000,
        "is_verified": true
        }''';

      const String mockNonVerifiedUserData = '''{
      "id": 1,
      "name": "John Doe",
      "balance": 5000,
      "is_verified": false
      }''';
      try {
        final data = options.path.contains('non_verified_user') ? mockNonVerifiedUserData:mockVerifiedUserData ;

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
}
