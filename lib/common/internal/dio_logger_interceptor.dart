import 'dart:developer';

import 'package:dio/dio.dart';

class DioLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST ${options.method} PATH ${options.path} BODY ${options.data}');
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR $err');
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE $response');
    handler.next(response);
  }
}
