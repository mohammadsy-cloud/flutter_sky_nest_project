// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightDetailsState {

 Data get status; String get message; Flight get flight;
/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightDetailsStateCopyWith<FlightDetailsState> get copyWith => _$FlightDetailsStateCopyWithImpl<FlightDetailsState>(this as FlightDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.flight, flight) || other.flight == flight));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,flight);

@override
String toString() {
  return 'FlightDetailsState(status: $status, message: $message, flight: $flight)';
}


}

/// @nodoc
abstract mixin class $FlightDetailsStateCopyWith<$Res>  {
  factory $FlightDetailsStateCopyWith(FlightDetailsState value, $Res Function(FlightDetailsState) _then) = _$FlightDetailsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, Flight flight
});


$FlightCopyWith<$Res> get flight;

}
/// @nodoc
class _$FlightDetailsStateCopyWithImpl<$Res>
    implements $FlightDetailsStateCopyWith<$Res> {
  _$FlightDetailsStateCopyWithImpl(this._self, this._then);

  final FlightDetailsState _self;
  final $Res Function(FlightDetailsState) _then;

/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? flight = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flight: null == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as Flight,
  ));
}
/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightCopyWith<$Res> get flight {
  
  return $FlightCopyWith<$Res>(_self.flight, (value) {
    return _then(_self.copyWith(flight: value));
  });
}
}


/// @nodoc


class _FlightDetailsState implements FlightDetailsState {
  const _FlightDetailsState({required this.status, required this.message, required this.flight});
  

@override final  Data status;
@override final  String message;
@override final  Flight flight;

/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightDetailsStateCopyWith<_FlightDetailsState> get copyWith => __$FlightDetailsStateCopyWithImpl<_FlightDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.flight, flight) || other.flight == flight));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,flight);

@override
String toString() {
  return 'FlightDetailsState(status: $status, message: $message, flight: $flight)';
}


}

/// @nodoc
abstract mixin class _$FlightDetailsStateCopyWith<$Res> implements $FlightDetailsStateCopyWith<$Res> {
  factory _$FlightDetailsStateCopyWith(_FlightDetailsState value, $Res Function(_FlightDetailsState) _then) = __$FlightDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, Flight flight
});


@override $FlightCopyWith<$Res> get flight;

}
/// @nodoc
class __$FlightDetailsStateCopyWithImpl<$Res>
    implements _$FlightDetailsStateCopyWith<$Res> {
  __$FlightDetailsStateCopyWithImpl(this._self, this._then);

  final _FlightDetailsState _self;
  final $Res Function(_FlightDetailsState) _then;

/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? flight = null,}) {
  return _then(_FlightDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flight: null == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as Flight,
  ));
}

/// Create a copy of FlightDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightCopyWith<$Res> get flight {
  
  return $FlightCopyWith<$Res>(_self.flight, (value) {
    return _then(_self.copyWith(flight: value));
  });
}
}

// dart format on
