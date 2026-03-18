import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException(this.message);

  final String message;

  factory ApiException.fromDioError(DioError e) {
    String message = 'Network error.';

    if (e.response?.data['message'] != null) {
      dynamic temp = e.response?.data['message'];

      if (temp is Map<String, dynamic>) {
        temp = temp.values.first?.firstOrNull;
      }

      message = temp;
    }

    return ApiException(message);
  }
}
