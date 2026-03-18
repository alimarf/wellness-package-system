import 'package:dio/dio.dart';

class OsCheckInterceptor extends Interceptor {
  final String mobileOs;
  OsCheckInterceptor(this.mobileOs);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'platform': 'mobile', 'os':mobileOs});
    super.onRequest(options, handler);
  }
}