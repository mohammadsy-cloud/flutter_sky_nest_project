// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_rooms_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllRoomsState {

 Data get status; String get statusMessage; Map<Hotel, List<Room>> get rooms; DateTimeRange get timeRange; String get query;
/// Create a copy of AllRoomsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllRoomsStateCopyWith<AllRoomsState> get copyWith => _$AllRoomsStateCopyWithImpl<AllRoomsState>(this as AllRoomsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllRoomsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other.rooms, rooms)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(rooms),timeRange,query);

@override
String toString() {
  return 'AllRoomsState(status: $status, statusMessage: $statusMessage, rooms: $rooms, timeRange: $timeRange, query: $query)';
}


}

/// @nodoc
abstract mixin class $AllRoomsStateCopyWith<$Res>  {
  factory $AllRoomsStateCopyWith(AllRoomsState value, $Res Function(AllRoomsState) _then) = _$AllRoomsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String statusMessage, Map<Hotel, List<Room>> rooms, DateTimeRange timeRange, String query
});




}
/// @nodoc
class _$AllRoomsStateCopyWithImpl<$Res>
    implements $AllRoomsStateCopyWith<$Res> {
  _$AllRoomsStateCopyWithImpl(this._self, this._then);

  final AllRoomsState _self;
  final $Res Function(AllRoomsState) _then;

/// Create a copy of AllRoomsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusMessage = null,Object? rooms = null,Object? timeRange = null,Object? query = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as Map<Hotel, List<Room>>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AllRoomsState implements AllRoomsState {
  const _AllRoomsState({required this.status, required this.statusMessage, required final  Map<Hotel, List<Room>> rooms, required this.timeRange, required this.query}): _rooms = rooms;
  

@override final  Data status;
@override final  String statusMessage;
 final  Map<Hotel, List<Room>> _rooms;
@override Map<Hotel, List<Room>> get rooms {
  if (_rooms is EqualUnmodifiableMapView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rooms);
}

@override final  DateTimeRange timeRange;
@override final  String query;

/// Create a copy of AllRoomsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllRoomsStateCopyWith<_AllRoomsState> get copyWith => __$AllRoomsStateCopyWithImpl<_AllRoomsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllRoomsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other._rooms, _rooms)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(_rooms),timeRange,query);

@override
String toString() {
  return 'AllRoomsState(status: $status, statusMessage: $statusMessage, rooms: $rooms, timeRange: $timeRange, query: $query)';
}


}

/// @nodoc
abstract mixin class _$AllRoomsStateCopyWith<$Res> implements $AllRoomsStateCopyWith<$Res> {
  factory _$AllRoomsStateCopyWith(_AllRoomsState value, $Res Function(_AllRoomsState) _then) = __$AllRoomsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String statusMessage, Map<Hotel, List<Room>> rooms, DateTimeRange timeRange, String query
});




}
/// @nodoc
class __$AllRoomsStateCopyWithImpl<$Res>
    implements _$AllRoomsStateCopyWith<$Res> {
  __$AllRoomsStateCopyWithImpl(this._self, this._then);

  final _AllRoomsState _self;
  final $Res Function(_AllRoomsState) _then;

/// Create a copy of AllRoomsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusMessage = null,Object? rooms = null,Object? timeRange = null,Object? query = null,}) {
  return _then(_AllRoomsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as Map<Hotel, List<Room>>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
