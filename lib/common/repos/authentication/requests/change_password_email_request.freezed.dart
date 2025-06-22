// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePasswordEmailRequest {

 String get email;
/// Create a copy of ChangePasswordEmailRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordEmailRequestCopyWith<ChangePasswordEmailRequest> get copyWith => _$ChangePasswordEmailRequestCopyWithImpl<ChangePasswordEmailRequest>(this as ChangePasswordEmailRequest, _$identity);

  /// Serializes this ChangePasswordEmailRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordEmailRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ChangePasswordEmailRequest(email: $email)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordEmailRequestCopyWith<$Res>  {
  factory $ChangePasswordEmailRequestCopyWith(ChangePasswordEmailRequest value, $Res Function(ChangePasswordEmailRequest) _then) = _$ChangePasswordEmailRequestCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ChangePasswordEmailRequestCopyWithImpl<$Res>
    implements $ChangePasswordEmailRequestCopyWith<$Res> {
  _$ChangePasswordEmailRequestCopyWithImpl(this._self, this._then);

  final ChangePasswordEmailRequest _self;
  final $Res Function(ChangePasswordEmailRequest) _then;

/// Create a copy of ChangePasswordEmailRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChangePasswordEmailRequest implements ChangePasswordEmailRequest {
   _ChangePasswordEmailRequest({required this.email});
  factory _ChangePasswordEmailRequest.fromJson(Map<String, dynamic> json) => _$ChangePasswordEmailRequestFromJson(json);

@override final  String email;

/// Create a copy of ChangePasswordEmailRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordEmailRequestCopyWith<_ChangePasswordEmailRequest> get copyWith => __$ChangePasswordEmailRequestCopyWithImpl<_ChangePasswordEmailRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordEmailRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordEmailRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ChangePasswordEmailRequest(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordEmailRequestCopyWith<$Res> implements $ChangePasswordEmailRequestCopyWith<$Res> {
  factory _$ChangePasswordEmailRequestCopyWith(_ChangePasswordEmailRequest value, $Res Function(_ChangePasswordEmailRequest) _then) = __$ChangePasswordEmailRequestCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ChangePasswordEmailRequestCopyWithImpl<$Res>
    implements _$ChangePasswordEmailRequestCopyWith<$Res> {
  __$ChangePasswordEmailRequestCopyWithImpl(this._self, this._then);

  final _ChangePasswordEmailRequest _self;
  final $Res Function(_ChangePasswordEmailRequest) _then;

/// Create a copy of ChangePasswordEmailRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ChangePasswordEmailRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
