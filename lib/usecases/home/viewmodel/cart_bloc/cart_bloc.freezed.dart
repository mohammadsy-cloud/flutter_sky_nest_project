// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// @nodoc


class AddedToCart implements CartEvent {
  const AddedToCart({required this.hotel, required this.room});
  

 final  Hotel hotel;
 final  Room room;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddedToCartCopyWith<AddedToCart> get copyWith => _$AddedToCartCopyWithImpl<AddedToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddedToCart&&(identical(other.hotel, hotel) || other.hotel == hotel)&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,hotel,room);

@override
String toString() {
  return 'CartEvent.addedToCart(hotel: $hotel, room: $room)';
}


}

/// @nodoc
abstract mixin class $AddedToCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $AddedToCartCopyWith(AddedToCart value, $Res Function(AddedToCart) _then) = _$AddedToCartCopyWithImpl;
@useResult
$Res call({
 Hotel hotel, Room room
});


$HotelCopyWith<$Res> get hotel;$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$AddedToCartCopyWithImpl<$Res>
    implements $AddedToCartCopyWith<$Res> {
  _$AddedToCartCopyWithImpl(this._self, this._then);

  final AddedToCart _self;
  final $Res Function(AddedToCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hotel = null,Object? room = null,}) {
  return _then(AddedToCart(
hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelCopyWith<$Res> get hotel {
  
  return $HotelCopyWith<$Res>(_self.hotel, (value) {
    return _then(_self.copyWith(hotel: value));
  });
}/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class RemovedFromCart implements CartEvent {
  const RemovedFromCart({required this.hotel, this.room});
  

 final  Hotel hotel;
 final  Room? room;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemovedFromCartCopyWith<RemovedFromCart> get copyWith => _$RemovedFromCartCopyWithImpl<RemovedFromCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemovedFromCart&&(identical(other.hotel, hotel) || other.hotel == hotel)&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,hotel,room);

@override
String toString() {
  return 'CartEvent.removedFromCart(hotel: $hotel, room: $room)';
}


}

/// @nodoc
abstract mixin class $RemovedFromCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $RemovedFromCartCopyWith(RemovedFromCart value, $Res Function(RemovedFromCart) _then) = _$RemovedFromCartCopyWithImpl;
@useResult
$Res call({
 Hotel hotel, Room? room
});


$HotelCopyWith<$Res> get hotel;$RoomCopyWith<$Res>? get room;

}
/// @nodoc
class _$RemovedFromCartCopyWithImpl<$Res>
    implements $RemovedFromCartCopyWith<$Res> {
  _$RemovedFromCartCopyWithImpl(this._self, this._then);

  final RemovedFromCart _self;
  final $Res Function(RemovedFromCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hotel = null,Object? room = freezed,}) {
  return _then(RemovedFromCart(
hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room?,
  ));
}

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelCopyWith<$Res> get hotel {
  
  return $HotelCopyWith<$Res>(_self.hotel, (value) {
    return _then(_self.copyWith(hotel: value));
  });
}/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res>? get room {
    if (_self.room == null) {
    return null;
  }

  return $RoomCopyWith<$Res>(_self.room!, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class CurrentHotelSet implements CartEvent {
  const CurrentHotelSet({required this.hotel});
  

 final  Hotel hotel;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentHotelSetCopyWith<CurrentHotelSet> get copyWith => _$CurrentHotelSetCopyWithImpl<CurrentHotelSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentHotelSet&&(identical(other.hotel, hotel) || other.hotel == hotel));
}


@override
int get hashCode => Object.hash(runtimeType,hotel);

@override
String toString() {
  return 'CartEvent.currentHotelSet(hotel: $hotel)';
}


}

/// @nodoc
abstract mixin class $CurrentHotelSetCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CurrentHotelSetCopyWith(CurrentHotelSet value, $Res Function(CurrentHotelSet) _then) = _$CurrentHotelSetCopyWithImpl;
@useResult
$Res call({
 Hotel hotel
});


$HotelCopyWith<$Res> get hotel;

}
/// @nodoc
class _$CurrentHotelSetCopyWithImpl<$Res>
    implements $CurrentHotelSetCopyWith<$Res> {
  _$CurrentHotelSetCopyWithImpl(this._self, this._then);

  final CurrentHotelSet _self;
  final $Res Function(CurrentHotelSet) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hotel = null,}) {
  return _then(CurrentHotelSet(
hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,
  ));
}

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelCopyWith<$Res> get hotel {
  
  return $HotelCopyWith<$Res>(_self.hotel, (value) {
    return _then(_self.copyWith(hotel: value));
  });
}
}

/// @nodoc


class ReservationCompleted implements CartEvent {
  const ReservationCompleted({required this.request});
  

 final  BookingRoomsRequest request;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCompletedCopyWith<ReservationCompleted> get copyWith => _$ReservationCompletedCopyWithImpl<ReservationCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationCompleted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'CartEvent.reservationCompleted(request: $request)';
}


}

/// @nodoc
abstract mixin class $ReservationCompletedCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $ReservationCompletedCopyWith(ReservationCompleted value, $Res Function(ReservationCompleted) _then) = _$ReservationCompletedCopyWithImpl;
@useResult
$Res call({
 BookingRoomsRequest request
});


$BookingRoomsRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ReservationCompletedCopyWithImpl<$Res>
    implements $ReservationCompletedCopyWith<$Res> {
  _$ReservationCompletedCopyWithImpl(this._self, this._then);

  final ReservationCompleted _self;
  final $Res Function(ReservationCompleted) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ReservationCompleted(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as BookingRoomsRequest,
  ));
}

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingRoomsRequestCopyWith<$Res> get request {
  
  return $BookingRoomsRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc
mixin _$CartState {

 Data get status; String get statusMessage; Map<Hotel, List<Room>> get hotelRooms; MapEntry<Hotel, List<Room>>? get currentHotel;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other.hotelRooms, hotelRooms)&&(identical(other.currentHotel, currentHotel) || other.currentHotel == currentHotel));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(hotelRooms),currentHotel);

@override
String toString() {
  return 'CartState(status: $status, statusMessage: $statusMessage, hotelRooms: $hotelRooms, currentHotel: $currentHotel)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 Data status, String statusMessage, Map<Hotel, List<Room>> hotelRooms, MapEntry<Hotel, List<Room>>? currentHotel
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusMessage = null,Object? hotelRooms = null,Object? currentHotel = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,hotelRooms: null == hotelRooms ? _self.hotelRooms : hotelRooms // ignore: cast_nullable_to_non_nullable
as Map<Hotel, List<Room>>,currentHotel: freezed == currentHotel ? _self.currentHotel : currentHotel // ignore: cast_nullable_to_non_nullable
as MapEntry<Hotel, List<Room>>?,
  ));
}

}


/// @nodoc


class _CartState implements CartState {
  const _CartState({required this.status, required this.statusMessage, required final  Map<Hotel, List<Room>> hotelRooms, this.currentHotel}): _hotelRooms = hotelRooms;
  

@override final  Data status;
@override final  String statusMessage;
 final  Map<Hotel, List<Room>> _hotelRooms;
@override Map<Hotel, List<Room>> get hotelRooms {
  if (_hotelRooms is EqualUnmodifiableMapView) return _hotelRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hotelRooms);
}

@override final  MapEntry<Hotel, List<Room>>? currentHotel;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other._hotelRooms, _hotelRooms)&&(identical(other.currentHotel, currentHotel) || other.currentHotel == currentHotel));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(_hotelRooms),currentHotel);

@override
String toString() {
  return 'CartState(status: $status, statusMessage: $statusMessage, hotelRooms: $hotelRooms, currentHotel: $currentHotel)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String statusMessage, Map<Hotel, List<Room>> hotelRooms, MapEntry<Hotel, List<Room>>? currentHotel
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusMessage = null,Object? hotelRooms = null,Object? currentHotel = freezed,}) {
  return _then(_CartState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,hotelRooms: null == hotelRooms ? _self._hotelRooms : hotelRooms // ignore: cast_nullable_to_non_nullable
as Map<Hotel, List<Room>>,currentHotel: freezed == currentHotel ? _self.currentHotel : currentHotel // ignore: cast_nullable_to_non_nullable
as MapEntry<Hotel, List<Room>>?,
  ));
}


}

// dart format on
