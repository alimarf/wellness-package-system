import 'data.dart';

class ApiResponse {
  int? status;
  bool? error;
  String? messages;
  Data? data;

  ApiResponse({this.status, this.error, this.messages, this.data});

  @override
  String toString() {
    return 'ApiResponse(status: $status, error: $error, messages: $messages, data: $data)';
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json['status'] as int?,
        error: json['error'] as bool?,
        messages: json['messages'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'error': error,
        'messages': messages,
        'data': data?.toJson(),
      };
}
