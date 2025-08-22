// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_reservations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightReservationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightReservationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightReservationsEvent()';
}


}

/// @nodoc
class $FlightReservationsEventCopyWith<$Res>  {
$FlightReservationsEventCopyWith(FlightReservationsEvent _, $Res Function(FlightReservationsEvent) __);
}


/// @nodoc


class FlightBookingsFetched implements FlightReservationsEvent {
  const FlightBookingsFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightBookingsFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightReservationsEvent.fetchFlightBookings()';
}


}




/// @nodoc


class FilterChanged implements FlightReservationsEvent {
  const FilterChanged(this.status);
  

 final  BookingStatus status;

/// Create a copy of FlightReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterChangedCopyWith<FilterChanged> get copyWith => _$FilterChangedCopyWithImpl<FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'FlightReservationsEvent.changeFilter(status: $status)';
}


}

/// @nodoc
abstract mixin class $FilterChangedCopyWith<$Res> implements $FlightReservationsEventCopyWith<$Res> {
  factory $FilterChangedCopyWith(FilterChanged value, $Res Function(FilterChanged) _then) = _$FilterChangedCopyWithImpl;
@useResult
$Res call({
 BookingStatus status
});




}
/// @nodoc
class _$FilterChangedCopyWithImpl<$Res>
    implements $FilterChangedCopyWith<$Res> {
  _$FilterChangedCopyWithImpl(this._self, this._then);

  final FilterChanged _self;
  final $Res Function(FilterChanged) _then;

/// Create a copy of FlightReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(FilterChanged(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,
  ));
}


}

/// @nodoc


class FlightBookingCancelled implements FlightReservationsEvent {
  const FlightBookingCancelled(this.flightId);
  

 final  int flightId;

/// Create a copy of FlightReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightBookingCancelledCopyWith<FlightBookingCancelled> get copyWith => _$FlightBookingCancelledCopyWithImpl<FlightBookingCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightBookingCancelled&&(identical(other.flightId, flightId) || other.flightId == flightId));
}


@override
int get hashCode => Object.hash(runtimeType,flightId);

@override
String toString() {
  return 'FlightReservationsEvent.cancelFlightBooking(flightId: $flightId)';
}


}

/// @nodoc
abstract mixin class $FlightBookingCancelledCopyWith<$Res> implements $FlightReservationsEventCopyWith<$Res> {
  factory $FlightBookingCancelledCopyWith(FlightBookingCancelled value, $Res Function(FlightBookingCancelled) _then) = _$FlightBookingCancelledCopyWithImpl;
@useResult
$Res call({
 int flightId
});




}
/// @nodoc
class _$FlightBookingCancelledCopyWithImpl<$Res>
    implements $FlightBookingCancelledCopyWith<$Res> {
  _$FlightBookingCancelledCopyWithImpl(this._self, this._then);

  final FlightBookingCancelled _self;
  final $Res Function(FlightBookingCancelled) _then;

/// Create a copy of FlightReservationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flightId = null,}) {
  return _then(FlightBookingCancelled(
null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FlightReservationsState {

 Data get status; String get message; List<Flight> get flights; BookingStatus get bookingStatus;
/// Create a copy of FlightReservationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightReservationsStateCopyWith<FlightReservationsState> get copyWith => _$FlightReservationsStateCopyWithImpl<FlightReservationsState>(this as FlightReservationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightReservationsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.flights, flights)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(flights),bookingStatus);

@override
String toString() {
  return 'FlightReservationsState(status: $status, message: $message, flights: $flights, bookingStatus: $bookingStatus)';
}


}

/// @nodoc
abstract mixin class $FlightReservationsStateCopyWith<$Res>  {
  factory $FlightReservationsStateCopyWith(FlightReservationsState value, $Res Function(FlightReservationsState) _then) = _$FlightReservationsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, List<Flight> flights, BookingStatus bookingStatus
});




}
/// @nodoc
class _$FlightReservationsStateCopyWithImpl<$Res>
    implements $FlightReservationsStateCopyWith<$Res> {
  _$FlightReservationsStateCopyWithImpl(this._self, this._then);

  final FlightReservationsState _self;
  final $Res Function(FlightReservationsState) _then;

/// Create a copy of FlightReservationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? flights = null,Object? bookingStatus = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flights: null == flights ? _self.flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,
  ));
}

}


/// @nodoc


class _FlightReservationsState implements FlightReservationsState {
  const _FlightReservationsState({required this.status, required this.message, required final  List<Flight> flights, required this.bookingStatus}): _flights = flights;
  

@override final  Data status;
@override final  String message;
 final  List<Flight> _flights;
@override List<Flight> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

@override final  BookingStatus bookingStatus;

/// Create a copy of FlightReservationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightReservationsStateCopyWith<_FlightReservationsState> get copyWith => __$FlightReservationsStateCopyWithImpl<_FlightReservationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightReservationsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._flights, _flights)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_flights),bookingStatus);

@override
String toString() {
  return 'FlightReservationsState(status: $status, message: $message, flights: $flights, bookingStatus: $bookingStatus)';
}


}

/// @nodoc
abstract mixin class _$FlightReservationsStateCopyWith<$Res> implements $FlightReservationsStateCopyWith<$Res> {
  factory _$FlightReservationsStateCopyWith(_FlightReservationsState value, $Res Function(_FlightReservationsState) _then) = __$FlightReservationsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, List<Flight> flights, BookingStatus bookingStatus
});




}
/// @nodoc
class __$FlightReservationsStateCopyWithImpl<$Res>
    implements _$FlightReservationsStateCopyWith<$Res> {
  __$FlightReservationsStateCopyWithImpl(this._self, this._then);

  final _FlightReservationsState _self;
  final $Res Function(_FlightReservationsState) _then;

/// Create a copy of FlightReservationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? flights = null,Object? bookingStatus = null,}) {
  return _then(_FlightReservationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,
  ));
}


}

// dart format on
