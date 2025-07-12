// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_rooms_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelRoomsState {

 Data get status; String get statusMessage; List<Room> get rooms; Hotel get hotel;
/// Create a copy of HotelRoomsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelRoomsStateCopyWith<HotelRoomsState> get copyWith => _$HotelRoomsStateCopyWithImpl<HotelRoomsState>(this as HotelRoomsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelRoomsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other.rooms, rooms)&&(identical(other.hotel, hotel) || other.hotel == hotel));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(rooms),hotel);

@override
String toString() {
  return 'HotelRoomsState(status: $status, statusMessage: $statusMessage, rooms: $rooms, hotel: $hotel)';
}


}

/// @nodoc
abstract mixin class $HotelRoomsStateCopyWith<$Res>  {
  factory $HotelRoomsStateCopyWith(HotelRoomsState value, $Res Function(HotelRoomsState) _then) = _$HotelRoomsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String statusMessage, List<Room> rooms, Hotel hotel
});


$HotelCopyWith<$Res> get hotel;

}
/// @nodoc
class _$HotelRoomsStateCopyWithImpl<$Res>
    implements $HotelRoomsStateCopyWith<$Res> {
  _$HotelRoomsStateCopyWithImpl(this._self, this._then);

  final HotelRoomsState _self;
  final $Res Function(HotelRoomsState) _then;

/// Create a copy of HotelRoomsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusMessage = null,Object? rooms = null,Object? hotel = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,
  ));
}
/// Create a copy of HotelRoomsState
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


class _HotelRoomsState implements HotelRoomsState {
  const _HotelRoomsState({required this.status, required this.statusMessage, required final  List<Room> rooms, required this.hotel}): _rooms = rooms;
  

@override final  Data status;
@override final  String statusMessage;
 final  List<Room> _rooms;
@override List<Room> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

@override final  Hotel hotel;

/// Create a copy of HotelRoomsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelRoomsStateCopyWith<_HotelRoomsState> get copyWith => __$HotelRoomsStateCopyWithImpl<_HotelRoomsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelRoomsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other._rooms, _rooms)&&(identical(other.hotel, hotel) || other.hotel == hotel));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(_rooms),hotel);

@override
String toString() {
  return 'HotelRoomsState(status: $status, statusMessage: $statusMessage, rooms: $rooms, hotel: $hotel)';
}


}

/// @nodoc
abstract mixin class _$HotelRoomsStateCopyWith<$Res> implements $HotelRoomsStateCopyWith<$Res> {
  factory _$HotelRoomsStateCopyWith(_HotelRoomsState value, $Res Function(_HotelRoomsState) _then) = __$HotelRoomsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String statusMessage, List<Room> rooms, Hotel hotel
});


@override $HotelCopyWith<$Res> get hotel;

}
/// @nodoc
class __$HotelRoomsStateCopyWithImpl<$Res>
    implements _$HotelRoomsStateCopyWith<$Res> {
  __$HotelRoomsStateCopyWithImpl(this._self, this._then);

  final _HotelRoomsState _self;
  final $Res Function(_HotelRoomsState) _then;

/// Create a copy of HotelRoomsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusMessage = null,Object? rooms = null,Object? hotel = null,}) {
  return _then(_HotelRoomsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,
  ));
}

/// Create a copy of HotelRoomsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelCopyWith<$Res> get hotel {
  
  return $HotelCopyWith<$Res>(_self.hotel, (value) {
    return _then(_self.copyWith(hotel: value));
  });
}
}

// dart format on
