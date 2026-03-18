// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Package _$PackageFromJson(Map<String, dynamic> json) => _Package(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: json['price'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  available: json['available'] as bool?,
);

Map<String, dynamic> _$PackageToJson(_Package instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'duration_minutes': instance.durationMinutes,
  'created_at': instance.createdAt,
  'available': instance.available,
};
