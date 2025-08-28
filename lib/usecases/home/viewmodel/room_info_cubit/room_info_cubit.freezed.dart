// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomInfoState {

 Data get status; String get message; Room get room;
/// Create a copy of RoomInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomInfoStateCopyWith<RoomInfoState> get copyWith => _$RoomInfoStateCopyWithImpl<RoomInfoState>(this as RoomInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,room);

@override
String toString() {
  return 'RoomInfoState(status: $status, message: $message, room: $room)';
}


}

/// @nodoc
abstract mixin class $RoomInfoStateCopyWith<$Res>  {
  factory $RoomInfoStateCopyWith(RoomInfoState value, $Res Function(RoomInfoState) _then) = _$RoomInfoStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, Room room
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$RoomInfoStateCopyWithImpl<$Res>
    implements $RoomInfoStateCopyWith<$Res> {
  _$RoomInfoStateCopyWithImpl(this._self, this._then);

  final RoomInfoState _self;
  final $Res Function(RoomInfoState) _then;

/// Create a copy of RoomInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? room = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}
/// Create a copy of RoomInfoState
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


class _RoomInfoState implements RoomInfoState {
  const _RoomInfoState({required this.status, required this.message, required this.room});
  

@override final  Data status;
@override final  String message;
@override final  Room room;

/// Create a copy of RoomInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomInfoStateCopyWith<_RoomInfoState> get copyWith => __$RoomInfoStateCopyWithImpl<_RoomInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,room);

@override
String toString() {
  return 'RoomInfoState(status: $status, message: $message, room: $room)';
}


}

/// @nodoc
abstract mixin class _$RoomInfoStateCopyWith<$Res> implements $RoomInfoStateCopyWith<$Res> {
  factory _$RoomInfoStateCopyWith(_RoomInfoState value, $Res Function(_RoomInfoState) _then) = __$RoomInfoStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, Room room
});


@override $RoomCopyWith<$Res> get room;

}
/// @nodoc
class __$RoomInfoStateCopyWithImpl<$Res>
    implements _$RoomInfoStateCopyWith<$Res> {
  __$RoomInfoStateCopyWithImpl(this._self, this._then);

  final _RoomInfoState _self;
  final $Res Function(_RoomInfoState) _then;

/// Create a copy of RoomInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? room = null,}) {
  return _then(_RoomInfoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,
  ));
}

/// Create a copy of RoomInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on
