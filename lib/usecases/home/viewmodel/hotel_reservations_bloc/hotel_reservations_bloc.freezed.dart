// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_reservations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelReservationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelReservationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HotelReservationsEvent()';
}


}

/// @nodoc
class $HotelReservationsEventCopyWith<$Res>  {
$HotelReservationsEventCopyWith(HotelReservationsEvent _, $Res Function(HotelReservationsEvent) __);
}


/// @nodoc


class ReservationsFetched implements HotelReservationsEvent {
  const ReservationsFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationsFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HotelReservationsEvent.reservationsFetched()';
}


}




/// @nodoc


class StatusChanged implements HotelReservationsEvent {
  const StatusChanged({required this.status});
  

 final  BookingStatus status;

/// Create a copy of HotelReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusChangedCopyWith<StatusChanged> get copyWith => _$StatusChangedCopyWithImpl<StatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'HotelReservationsEvent.statusChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class $StatusChangedCopyWith<$Res> implements $HotelReservationsEventCopyWith<$Res> {
  factory $StatusChangedCopyWith(StatusChanged value, $Res Function(StatusChanged) _then) = _$StatusChangedCopyWithImpl;
@useResult
$Res call({
 BookingStatus status
});




}
/// @nodoc
class _$StatusChangedCopyWithImpl<$Res>
    implements $StatusChangedCopyWith<$Res> {
  _$StatusChangedCopyWithImpl(this._self, this._then);

  final StatusChanged _self;
  final $Res Function(StatusChanged) _then;

/// Create a copy of HotelReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(StatusChanged(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,
  ));
}


}

/// @nodoc
mixin _$HotelReservationsState {

 Data get status; String get statusMessage; BookingStatus get bookingStatus; List<Reservation> get reservations;
/// Create a copy of HotelReservationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelReservationsStateCopyWith<HotelReservationsState> get copyWith => _$HotelReservationsStateCopyWithImpl<HotelReservationsState>(this as HotelReservationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelReservationsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&const DeepCollectionEquality().equals(other.reservations, reservations));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,bookingStatus,const DeepCollectionEquality().hash(reservations));

@override
String toString() {
  return 'HotelReservationsState(status: $status, statusMessage: $statusMessage, bookingStatus: $bookingStatus, reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class $HotelReservationsStateCopyWith<$Res>  {
  factory $HotelReservationsStateCopyWith(HotelReservationsState value, $Res Function(HotelReservationsState) _then) = _$HotelReservationsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String statusMessage, BookingStatus bookingStatus, List<Reservation> reservations
});




}
/// @nodoc
class _$HotelReservationsStateCopyWithImpl<$Res>
    implements $HotelReservationsStateCopyWith<$Res> {
  _$HotelReservationsStateCopyWithImpl(this._self, this._then);

  final HotelReservationsState _self;
  final $Res Function(HotelReservationsState) _then;

/// Create a copy of HotelReservationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusMessage = null,Object? bookingStatus = null,Object? reservations = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<Reservation>,
  ));
}

}


/// @nodoc


class _HotelReservationsState implements HotelReservationsState {
  const _HotelReservationsState({required this.status, required this.statusMessage, required this.bookingStatus, required final  List<Reservation> reservations}): _reservations = reservations;
  

@override final  Data status;
@override final  String statusMessage;
@override final  BookingStatus bookingStatus;
 final  List<Reservation> _reservations;
@override List<Reservation> get reservations {
  if (_reservations is EqualUnmodifiableListView) return _reservations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservations);
}


/// Create a copy of HotelReservationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelReservationsStateCopyWith<_HotelReservationsState> get copyWith => __$HotelReservationsStateCopyWithImpl<_HotelReservationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelReservationsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&const DeepCollectionEquality().equals(other._reservations, _reservations));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,bookingStatus,const DeepCollectionEquality().hash(_reservations));

@override
String toString() {
  return 'HotelReservationsState(status: $status, statusMessage: $statusMessage, bookingStatus: $bookingStatus, reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class _$HotelReservationsStateCopyWith<$Res> implements $HotelReservationsStateCopyWith<$Res> {
  factory _$HotelReservationsStateCopyWith(_HotelReservationsState value, $Res Function(_HotelReservationsState) _then) = __$HotelReservationsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String statusMessage, BookingStatus bookingStatus, List<Reservation> reservations
});




}
/// @nodoc
class __$HotelReservationsStateCopyWithImpl<$Res>
    implements _$HotelReservationsStateCopyWith<$Res> {
  __$HotelReservationsStateCopyWithImpl(this._self, this._then);

  final _HotelReservationsState _self;
  final $Res Function(_HotelReservationsState) _then;

/// Create a copy of HotelReservationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusMessage = null,Object? bookingStatus = null,Object? reservations = null,}) {
  return _then(_HotelReservationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,reservations: null == reservations ? _self._reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<Reservation>,
  ));
}


}

// dart format on
