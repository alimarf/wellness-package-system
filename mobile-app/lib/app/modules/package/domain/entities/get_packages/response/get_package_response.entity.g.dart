// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_package_response.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPackageResponse _$GetPackageResponseFromJson(Map<String, dynamic> json) =>
    _GetPackageResponse(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPackageResponseToJson(_GetPackageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
