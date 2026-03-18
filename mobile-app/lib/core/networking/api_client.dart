import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  ApiClient({
    required String baseUrl,
    List<Interceptor> interceptors = const [],
  }) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
      receiveDataWhenStatusError: true,
      followRedirects: false,
      validateStatus: (status) => status! < 300,
    );

    dio.interceptors.addAll(interceptors);
  }
}
