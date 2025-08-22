// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_reservation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightReservationRequest {

 int get flightId; int get numberOfPerson;
/// Create a copy of FlightReservationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightReservationRequestCopyWith<FlightReservationRequest> get copyWith => _$FlightReservationRequestCopyWithImpl<FlightReservationRequest>(this as FlightReservationRequest, _$identity);

  /// Serializes this FlightReservationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightReservationRequest&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flightId,numberOfPerson);

@override
String toString() {
  return 'FlightReservationRequest(flightId: $flightId, numberOfPerson: $numberOfPerson)';
}


}

/// @nodoc
abstract mixin class $FlightReservationRequestCopyWith<$Res>  {
  factory $FlightReservationRequestCopyWith(FlightReservationRequest value, $Res Function(FlightReservationRequest) _then) = _$FlightReservationRequestCopyWithImpl;
@useResult
$Res call({
 int flightId, int numberOfPerson
});




}
/// @nodoc
class _$FlightReservationRequestCopyWithImpl<$Res>
    implements $FlightReservationRequestCopyWith<$Res> {
  _$FlightReservationRequestCopyWithImpl(this._self, this._then);

  final FlightReservationRequest _self;
  final $Res Function(FlightReservationRequest) _then;

/// Create a copy of FlightReservationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flightId = null,Object? numberOfPerson = null,}) {
  return _then(_self.copyWith(
flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FlightReservationRequest implements FlightReservationRequest {
   _FlightReservationRequest({required this.flightId, required this.numberOfPerson});
  factory _FlightReservationRequest.fromJson(Map<String, dynamic> json) => _$FlightReservationRequestFromJson(json);

@override final  int flightId;
@override final  int numberOfPerson;

/// Create a copy of FlightReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightReservationRequestCopyWith<_FlightReservationRequest> get copyWith => __$FlightReservationRequestCopyWithImpl<_FlightReservationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightReservationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightReservationRequest&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flightId,numberOfPerson);

@override
String toString() {
  return 'FlightReservationRequest(flightId: $flightId, numberOfPerson: $numberOfPerson)';
}


}

/// @nodoc
abstract mixin class _$FlightReservationRequestCopyWith<$Res> implements $FlightReservationRequestCopyWith<$Res> {
  factory _$FlightReservationRequestCopyWith(_FlightReservationRequest value, $Res Function(_FlightReservationRequest) _then) = __$FlightReservationRequestCopyWithImpl;
@override @useResult
$Res call({
 int flightId, int numberOfPerson
});




}
/// @nodoc
class __$FlightReservationRequestCopyWithImpl<$Res>
    implements _$FlightReservationRequestCopyWith<$Res> {
  __$FlightReservationRequestCopyWithImpl(this._self, this._then);

  final _FlightReservationRequest _self;
  final $Res Function(_FlightReservationRequest) _then;

/// Create a copy of FlightReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flightId = null,Object? numberOfPerson = null,}) {
  return _then(_FlightReservationRequest(
flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
