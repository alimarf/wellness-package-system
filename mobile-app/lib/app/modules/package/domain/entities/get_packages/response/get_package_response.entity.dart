// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/app/modules/package/domain/entities/package/package.entity.dart';

part 'get_package_response.entity.freezed.dart';
part 'get_package_response.entity.g.dart';

@freezed
abstract class GetPackageResponse with _$GetPackageResponse {
  factory GetPackageResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'statusCode') int? statusCode,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') List<Package>? data,
  }) = _GetPackageResponse;

  factory GetPackageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPackageResponseFromJson(json);
}
