import 'package:dio/dio.dart';
import 'package:flutter_app/providers/auth.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/v1/',
      responseType: ResponseType.plain,
      connectTimeout: 15 * 1000, // 60 seconds
      receiveTimeout: 15 * 1000,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      await requestInterceptor(options);
      return handler.next(options);
    },
  ));

  return dio;
}

dynamic requestInterceptor(RequestOptions options) async {
  if (options.headers.containsKey('auth')) {
    var token = await Auth().getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
  }
}
