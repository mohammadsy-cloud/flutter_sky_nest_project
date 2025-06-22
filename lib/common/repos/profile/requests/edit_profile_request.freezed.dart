// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditProfileRequest {

 String? get password; String? get fullName; double? get longitude; double? get latitude;
/// Create a copy of EditProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileRequestCopyWith<EditProfileRequest> get copyWith => _$EditProfileRequestCopyWithImpl<EditProfileRequest>(this as EditProfileRequest, _$identity);

  /// Serializes this EditProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileRequest&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,fullName,longitude,latitude);

@override
String toString() {
  return 'EditProfileRequest(password: $password, fullName: $fullName, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class $EditProfileRequestCopyWith<$Res>  {
  factory $EditProfileRequestCopyWith(EditProfileRequest value, $Res Function(EditProfileRequest) _then) = _$EditProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? password, String? fullName, double? longitude, double? latitude
});




}
/// @nodoc
class _$EditProfileRequestCopyWithImpl<$Res>
    implements $EditProfileRequestCopyWith<$Res> {
  _$EditProfileRequestCopyWithImpl(this._self, this._then);

  final EditProfileRequest _self;
  final $Res Function(EditProfileRequest) _then;

/// Create a copy of EditProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = freezed,Object? fullName = freezed,Object? longitude = freezed,Object? latitude = freezed,}) {
  return _then(_self.copyWith(
password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EditProfileRequest implements EditProfileRequest {
   _EditProfileRequest({this.password, this.fullName, this.longitude, this.latitude});
  factory _EditProfileRequest.fromJson(Map<String, dynamic> json) => _$EditProfileRequestFromJson(json);

@override final  String? password;
@override final  String? fullName;
@override final  double? longitude;
@override final  double? latitude;

/// Create a copy of EditProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileRequestCopyWith<_EditProfileRequest> get copyWith => __$EditProfileRequestCopyWithImpl<_EditProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileRequest&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,fullName,longitude,latitude);

@override
String toString() {
  return 'EditProfileRequest(password: $password, fullName: $fullName, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class _$EditProfileRequestCopyWith<$Res> implements $EditProfileRequestCopyWith<$Res> {
  factory _$EditProfileRequestCopyWith(_EditProfileRequest value, $Res Function(_EditProfileRequest) _then) = __$EditProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? password, String? fullName, double? longitude, double? latitude
});




}
/// @nodoc
class __$EditProfileRequestCopyWithImpl<$Res>
    implements _$EditProfileRequestCopyWith<$Res> {
  __$EditProfileRequestCopyWithImpl(this._self, this._then);

  final _EditProfileRequest _self;
  final $Res Function(_EditProfileRequest) _then;

/// Create a copy of EditProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = freezed,Object? fullName = freezed,Object? longitude = freezed,Object? latitude = freezed,}) {
  return _then(_EditProfileRequest(
password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
