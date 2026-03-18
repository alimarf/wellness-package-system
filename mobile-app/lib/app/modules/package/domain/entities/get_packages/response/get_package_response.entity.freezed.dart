// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_package_response.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPackageResponse {

@JsonKey(name: 'success') bool? get success;@JsonKey(name: 'statusCode') int? get statusCode;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'data') List<Package>? get data;
/// Create a copy of GetPackageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPackageResponseCopyWith<GetPackageResponse> get copyWith => _$GetPackageResponseCopyWithImpl<GetPackageResponse>(this as GetPackageResponse, _$identity);

  /// Serializes this GetPackageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPackageResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetPackageResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetPackageResponseCopyWith<$Res>  {
  factory $GetPackageResponseCopyWith(GetPackageResponse value, $Res Function(GetPackageResponse) _then) = _$GetPackageResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') List<Package>? data
});




}
/// @nodoc
class _$GetPackageResponseCopyWithImpl<$Res>
    implements $GetPackageResponseCopyWith<$Res> {
  _$GetPackageResponseCopyWithImpl(this._self, this._then);

  final GetPackageResponse _self;
  final $Res Function(GetPackageResponse) _then;

/// Create a copy of GetPackageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Package>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPackageResponse].
extension GetPackageResponsePatterns on GetPackageResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPackageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPackageResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPackageResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPackageResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPackageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPackageResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<Package>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPackageResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<Package>? data)  $default,) {final _that = this;
switch (_that) {
case _GetPackageResponse():
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool? success, @JsonKey(name: 'statusCode')  int? statusCode, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'data')  List<Package>? data)?  $default,) {final _that = this;
switch (_that) {
case _GetPackageResponse() when $default != null:
return $default(_that.success,_that.statusCode,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPackageResponse implements GetPackageResponse {
   _GetPackageResponse({@JsonKey(name: 'success') this.success, @JsonKey(name: 'statusCode') this.statusCode, @JsonKey(name: 'message') this.message, @JsonKey(name: 'data') final  List<Package>? data}): _data = data;
  factory _GetPackageResponse.fromJson(Map<String, dynamic> json) => _$GetPackageResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool? success;
@override@JsonKey(name: 'statusCode') final  int? statusCode;
@override@JsonKey(name: 'message') final  String? message;
 final  List<Package>? _data;
@override@JsonKey(name: 'data') List<Package>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetPackageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPackageResponseCopyWith<_GetPackageResponse> get copyWith => __$GetPackageResponseCopyWithImpl<_GetPackageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPackageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPackageResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,statusCode,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetPackageResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetPackageResponseCopyWith<$Res> implements $GetPackageResponseCopyWith<$Res> {
  factory _$GetPackageResponseCopyWith(_GetPackageResponse value, $Res Function(_GetPackageResponse) _then) = __$GetPackageResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool? success,@JsonKey(name: 'statusCode') int? statusCode,@JsonKey(name: 'message') String? message,@JsonKey(name: 'data') List<Package>? data
});




}
/// @nodoc
class __$GetPackageResponseCopyWithImpl<$Res>
    implements _$GetPackageResponseCopyWith<$Res> {
  __$GetPackageResponseCopyWithImpl(this._self, this._then);

  final _GetPackageResponse _self;
  final $Res Function(_GetPackageResponse) _then;

/// Create a copy of GetPackageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? statusCode = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_GetPackageResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Package>?,
  ));
}


}

// dart format on
