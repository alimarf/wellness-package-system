// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.entity.freezed.dart';
part 'package.entity.g.dart';

@freezed
abstract class Package with _$Package {
  factory Package({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'available') bool? available,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);
}