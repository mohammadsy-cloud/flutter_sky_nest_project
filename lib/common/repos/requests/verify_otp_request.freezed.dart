// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtpRequest {

 String get email; String get code;
/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith => _$VerifyOtpRequestCopyWithImpl<VerifyOtpRequest>(this as VerifyOtpRequest, _$identity);

  /// Serializes this VerifyOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,code);

@override
String toString() {
  return 'VerifyOtpRequest(email: $email, code: $code)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpRequestCopyWith<$Res>  {
  factory $VerifyOtpRequestCopyWith(VerifyOtpRequest value, $Res Function(VerifyOtpRequest) _then) = _$VerifyOtpRequestCopyWithImpl;
@useResult
$Res call({
 String email, String code
});




}
/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final VerifyOtpRequest _self;
  final $Res Function(VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? code = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VerifyOtpRequest implements VerifyOtpRequest {
   _VerifyOtpRequest({required this.email, required this.code});
  factory _VerifyOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestFromJson(json);

@override final  String email;
@override final  String code;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpRequestCopyWith<_VerifyOtpRequest> get copyWith => __$VerifyOtpRequestCopyWithImpl<_VerifyOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,code);

@override
String toString() {
  return 'VerifyOtpRequest(email: $email, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpRequestCopyWith<$Res> implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$VerifyOtpRequestCopyWith(_VerifyOtpRequest value, $Res Function(_VerifyOtpRequest) _then) = __$VerifyOtpRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String code
});




}
/// @nodoc
class __$VerifyOtpRequestCopyWithImpl<$Res>
    implements _$VerifyOtpRequestCopyWith<$Res> {
  __$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final _VerifyOtpRequest _self;
  final $Res Function(_VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,}) {
  return _then(_VerifyOtpRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
