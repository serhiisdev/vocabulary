import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vocabulary/core/extensions/string_ext.dart';

abstract class AppDioProvider {
  static Dio createTtsDio({required String baseUrl, required String apiKey}) {
    final dio = Dio(
      BaseOptions(baseUrl: baseUrl, headers: {'xi-api-key': apiKey}),
    );

    _applyCommonConfig(dio);
    return dio;
  }

  static void _applyCommonConfig(Dio dio) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        logPrint: (object) => log(object.toString().truncate(1000)),
      ),
    );
  }
}
