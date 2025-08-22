// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_card_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReservationCardState {

 Data get status; String get message; Reservation get reservation;
/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCardStateCopyWith<ReservationCardState> get copyWith => _$ReservationCardStateCopyWithImpl<ReservationCardState>(this as ReservationCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.reservation, reservation) || other.reservation == reservation));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,reservation);

@override
String toString() {
  return 'ReservationCardState(status: $status, message: $message, reservation: $reservation)';
}


}

/// @nodoc
abstract mixin class $ReservationCardStateCopyWith<$Res>  {
  factory $ReservationCardStateCopyWith(ReservationCardState value, $Res Function(ReservationCardState) _then) = _$ReservationCardStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, Reservation reservation
});


$ReservationCopyWith<$Res> get reservation;

}
/// @nodoc
class _$ReservationCardStateCopyWithImpl<$Res>
    implements $ReservationCardStateCopyWith<$Res> {
  _$ReservationCardStateCopyWithImpl(this._self, this._then);

  final ReservationCardState _self;
  final $Res Function(ReservationCardState) _then;

/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? reservation = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as Reservation,
  ));
}
/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationCopyWith<$Res> get reservation {
  
  return $ReservationCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}


/// @nodoc


class _ReservationCardState implements ReservationCardState {
  const _ReservationCardState({required this.status, required this.message, required this.reservation});
  

@override final  Data status;
@override final  String message;
@override final  Reservation reservation;

/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCardStateCopyWith<_ReservationCardState> get copyWith => __$ReservationCardStateCopyWithImpl<_ReservationCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.reservation, reservation) || other.reservation == reservation));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,reservation);

@override
String toString() {
  return 'ReservationCardState(status: $status, message: $message, reservation: $reservation)';
}


}

/// @nodoc
abstract mixin class _$ReservationCardStateCopyWith<$Res> implements $ReservationCardStateCopyWith<$Res> {
  factory _$ReservationCardStateCopyWith(_ReservationCardState value, $Res Function(_ReservationCardState) _then) = __$ReservationCardStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, Reservation reservation
});


@override $ReservationCopyWith<$Res> get reservation;

}
/// @nodoc
class __$ReservationCardStateCopyWithImpl<$Res>
    implements _$ReservationCardStateCopyWith<$Res> {
  __$ReservationCardStateCopyWithImpl(this._self, this._then);

  final _ReservationCardState _self;
  final $Res Function(_ReservationCardState) _then;

/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? reservation = null,}) {
  return _then(_ReservationCardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as Reservation,
  ));
}

/// Create a copy of ReservationCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationCopyWith<$Res> get reservation {
  
  return $ReservationCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}

// dart format on
