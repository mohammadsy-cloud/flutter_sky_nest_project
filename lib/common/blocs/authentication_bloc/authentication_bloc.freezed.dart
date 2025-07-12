// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent()';
}


}

/// @nodoc
class $AuthenticationEventCopyWith<$Res>  {
$AuthenticationEventCopyWith(AuthenticationEvent _, $Res Function(AuthenticationEvent) __);
}


/// @nodoc


class AuthSignUp with DiagnosticableTreeMixin implements AuthenticationEvent {
  const AuthSignUp({required this.request});
  

 final  RegisterRequest request;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSignUpCopyWith<AuthSignUp> get copyWith => _$AuthSignUpCopyWithImpl<AuthSignUp>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.signUp'))
    ..add(DiagnosticsProperty('request', request));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSignUp&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.signUp(request: $request)';
}


}

/// @nodoc
abstract mixin class $AuthSignUpCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $AuthSignUpCopyWith(AuthSignUp value, $Res Function(AuthSignUp) _then) = _$AuthSignUpCopyWithImpl;
@useResult
$Res call({
 RegisterRequest request
});


$RegisterRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$AuthSignUpCopyWithImpl<$Res>
    implements $AuthSignUpCopyWith<$Res> {
  _$AuthSignUpCopyWithImpl(this._self, this._then);

  final AuthSignUp _self;
  final $Res Function(AuthSignUp) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(AuthSignUp(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RegisterRequest,
  ));
}

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterRequestCopyWith<$Res> get request {
  
  return $RegisterRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class AuthLogIn with DiagnosticableTreeMixin implements AuthenticationEvent {
  const AuthLogIn({required this.request});
  

 final  LoginRequest request;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLogInCopyWith<AuthLogIn> get copyWith => _$AuthLogInCopyWithImpl<AuthLogIn>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.login'))
    ..add(DiagnosticsProperty('request', request));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogIn&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.login(request: $request)';
}


}

/// @nodoc
abstract mixin class $AuthLogInCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $AuthLogInCopyWith(AuthLogIn value, $Res Function(AuthLogIn) _then) = _$AuthLogInCopyWithImpl;
@useResult
$Res call({
 LoginRequest request
});


$LoginRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$AuthLogInCopyWithImpl<$Res>
    implements $AuthLogInCopyWith<$Res> {
  _$AuthLogInCopyWithImpl(this._self, this._then);

  final AuthLogIn _self;
  final $Res Function(AuthLogIn) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(AuthLogIn(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as LoginRequest,
  ));
}

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<$Res> get request {
  
  return $LoginRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class AuthLogOut with DiagnosticableTreeMixin implements AuthenticationEvent {
  const AuthLogOut();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.logout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.logout()';
}


}




/// @nodoc


class LogInWithToken with DiagnosticableTreeMixin implements AuthenticationEvent {
  const LogInWithToken();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.logInWithToken'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogInWithToken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.logInWithToken()';
}


}




/// @nodoc


class ChangePasswordEmail with DiagnosticableTreeMixin implements AuthenticationEvent {
  const ChangePasswordEmail({required this.request});
  

 final  ChangePasswordEmailRequest request;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordEmailCopyWith<ChangePasswordEmail> get copyWith => _$ChangePasswordEmailCopyWithImpl<ChangePasswordEmail>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.changePasswordEmail'))
    ..add(DiagnosticsProperty('request', request));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordEmail&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.changePasswordEmail(request: $request)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordEmailCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $ChangePasswordEmailCopyWith(ChangePasswordEmail value, $Res Function(ChangePasswordEmail) _then) = _$ChangePasswordEmailCopyWithImpl;
@useResult
$Res call({
 ChangePasswordEmailRequest request
});


$ChangePasswordEmailRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ChangePasswordEmailCopyWithImpl<$Res>
    implements $ChangePasswordEmailCopyWith<$Res> {
  _$ChangePasswordEmailCopyWithImpl(this._self, this._then);

  final ChangePasswordEmail _self;
  final $Res Function(ChangePasswordEmail) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ChangePasswordEmail(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ChangePasswordEmailRequest,
  ));
}

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangePasswordEmailRequestCopyWith<$Res> get request {
  
  return $ChangePasswordEmailRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ChangePasswordVerify with DiagnosticableTreeMixin implements AuthenticationEvent {
  const ChangePasswordVerify({required this.request});
  

 final  VerifyOtpRequest request;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordVerifyCopyWith<ChangePasswordVerify> get copyWith => _$ChangePasswordVerifyCopyWithImpl<ChangePasswordVerify>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.changePasswordVerify'))
    ..add(DiagnosticsProperty('request', request));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordVerify&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.changePasswordVerify(request: $request)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordVerifyCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $ChangePasswordVerifyCopyWith(ChangePasswordVerify value, $Res Function(ChangePasswordVerify) _then) = _$ChangePasswordVerifyCopyWithImpl;
@useResult
$Res call({
 VerifyOtpRequest request
});


$VerifyOtpRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ChangePasswordVerifyCopyWithImpl<$Res>
    implements $ChangePasswordVerifyCopyWith<$Res> {
  _$ChangePasswordVerifyCopyWithImpl(this._self, this._then);

  final ChangePasswordVerify _self;
  final $Res Function(ChangePasswordVerify) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ChangePasswordVerify(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as VerifyOtpRequest,
  ));
}

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpRequestCopyWith<$Res> get request {
  
  return $VerifyOtpRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ChangePassword with DiagnosticableTreeMixin implements AuthenticationEvent {
  const ChangePassword({required this.request});
  

 final  ChangePasswordRequest request;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordCopyWith<ChangePassword> get copyWith => _$ChangePasswordCopyWithImpl<ChangePassword>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.changePassword'))
    ..add(DiagnosticsProperty('request', request));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePassword&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.changePassword(request: $request)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $ChangePasswordCopyWith(ChangePassword value, $Res Function(ChangePassword) _then) = _$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 ChangePasswordRequest request
});


$ChangePasswordRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ChangePasswordCopyWithImpl<$Res>
    implements $ChangePasswordCopyWith<$Res> {
  _$ChangePasswordCopyWithImpl(this._self, this._then);

  final ChangePassword _self;
  final $Res Function(ChangePassword) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ChangePassword(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ChangePasswordRequest,
  ));
}

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangePasswordRequestCopyWith<$Res> get request {
  
  return $ChangePasswordRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class AuthAddLocation with DiagnosticableTreeMixin implements AuthenticationEvent {
  const AuthAddLocation({required this.lat, required this.long});
  

 final  double lat;
 final  double long;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAddLocationCopyWith<AuthAddLocation> get copyWith => _$AuthAddLocationCopyWithImpl<AuthAddLocation>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.addLocation'))
    ..add(DiagnosticsProperty('lat', lat))..add(DiagnosticsProperty('long', long));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAddLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}


@override
int get hashCode => Object.hash(runtimeType,lat,long);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.addLocation(lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $AuthAddLocationCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $AuthAddLocationCopyWith(AuthAddLocation value, $Res Function(AuthAddLocation) _then) = _$AuthAddLocationCopyWithImpl;
@useResult
$Res call({
 double lat, double long
});




}
/// @nodoc
class _$AuthAddLocationCopyWithImpl<$Res>
    implements $AuthAddLocationCopyWith<$Res> {
  _$AuthAddLocationCopyWithImpl(this._self, this._then);

  final AuthAddLocation _self;
  final $Res Function(AuthAddLocation) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? long = null,}) {
  return _then(AuthAddLocation(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class VerifyOTP with DiagnosticableTreeMixin implements AuthenticationEvent {
  const VerifyOTP({required this.otp});
  

 final  String otp;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOTPCopyWith<VerifyOTP> get copyWith => _$VerifyOTPCopyWithImpl<VerifyOTP>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationEvent.verifyOTP'))
    ..add(DiagnosticsProperty('otp', otp));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOTP&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationEvent.verifyOTP(otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOTPCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $VerifyOTPCopyWith(VerifyOTP value, $Res Function(VerifyOTP) _then) = _$VerifyOTPCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class _$VerifyOTPCopyWithImpl<$Res>
    implements $VerifyOTPCopyWith<$Res> {
  _$VerifyOTPCopyWithImpl(this._self, this._then);

  final VerifyOTP _self;
  final $Res Function(VerifyOTP) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(VerifyOTP(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthenticationState implements DiagnosticableTreeMixin {

 User? get user; String? get token; Data get dataState; String get message; bool get isAuthenticated;
/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationStateCopyWith<AuthenticationState> get copyWith => _$AuthenticationStateCopyWithImpl<AuthenticationState>(this as AuthenticationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationState'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('dataState', dataState))..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('isAuthenticated', isAuthenticated));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationState&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.dataState, dataState) || other.dataState == dataState)&&(identical(other.message, message) || other.message == message)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,user,token,dataState,message,isAuthenticated);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationState(user: $user, token: $token, dataState: $dataState, message: $message, isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class $AuthenticationStateCopyWith<$Res>  {
  factory $AuthenticationStateCopyWith(AuthenticationState value, $Res Function(AuthenticationState) _then) = _$AuthenticationStateCopyWithImpl;
@useResult
$Res call({
 User? user, String? token, Data dataState, String message, bool isAuthenticated
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._self, this._then);

  final AuthenticationState _self;
  final $Res Function(AuthenticationState) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? token = freezed,Object? dataState = null,Object? message = null,Object? isAuthenticated = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,dataState: null == dataState ? _self.dataState : dataState // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc


class _AuthenticationBlocState with DiagnosticableTreeMixin implements AuthenticationState {
  const _AuthenticationBlocState({this.user, this.token, required this.dataState, required this.message, required this.isAuthenticated});
  

@override final  User? user;
@override final  String? token;
@override final  Data dataState;
@override final  String message;
@override final  bool isAuthenticated;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticationBlocStateCopyWith<_AuthenticationBlocState> get copyWith => __$AuthenticationBlocStateCopyWithImpl<_AuthenticationBlocState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthenticationState'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('dataState', dataState))..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('isAuthenticated', isAuthenticated));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationBlocState&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.dataState, dataState) || other.dataState == dataState)&&(identical(other.message, message) || other.message == message)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,user,token,dataState,message,isAuthenticated);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthenticationState(user: $user, token: $token, dataState: $dataState, message: $message, isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class _$AuthenticationBlocStateCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticationBlocStateCopyWith(_AuthenticationBlocState value, $Res Function(_AuthenticationBlocState) _then) = __$AuthenticationBlocStateCopyWithImpl;
@override @useResult
$Res call({
 User? user, String? token, Data dataState, String message, bool isAuthenticated
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthenticationBlocStateCopyWithImpl<$Res>
    implements _$AuthenticationBlocStateCopyWith<$Res> {
  __$AuthenticationBlocStateCopyWithImpl(this._self, this._then);

  final _AuthenticationBlocState _self;
  final $Res Function(_AuthenticationBlocState) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? token = freezed,Object? dataState = null,Object? message = null,Object? isAuthenticated = null,}) {
  return _then(_AuthenticationBlocState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,dataState: null == dataState ? _self.dataState : dataState // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
