// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// @nodoc


class NearbyHotelsFetched implements HomeEvent {
  const NearbyHotelsFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyHotelsFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.nearbyHotelsFetched()';
}


}




/// @nodoc


class NearbyFlightsFetched implements HomeEvent {
  const NearbyFlightsFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyFlightsFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.nearbyFlightsFetched()';
}


}




/// @nodoc
mixin _$HomeState {

 List<Hotel> get hotelsList; Data get hotelsListStatus; int get notificationCount; Data get dataStatus; String get statusMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.hotelsList, hotelsList)&&(identical(other.hotelsListStatus, hotelsListStatus) || other.hotelsListStatus == hotelsListStatus)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hotelsList),hotelsListStatus,notificationCount,dataStatus,statusMessage);

@override
String toString() {
  return 'HomeState(hotelsList: $hotelsList, hotelsListStatus: $hotelsListStatus, notificationCount: $notificationCount, dataStatus: $dataStatus, statusMessage: $statusMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<Hotel> hotelsList, Data hotelsListStatus, int notificationCount, Data dataStatus, String statusMessage
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelsList = null,Object? hotelsListStatus = null,Object? notificationCount = null,Object? dataStatus = null,Object? statusMessage = null,}) {
  return _then(_self.copyWith(
hotelsList: null == hotelsList ? _self.hotelsList : hotelsList // ignore: cast_nullable_to_non_nullable
as List<Hotel>,hotelsListStatus: null == hotelsListStatus ? _self.hotelsListStatus : hotelsListStatus // ignore: cast_nullable_to_non_nullable
as Data,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required final  List<Hotel> hotelsList, required this.hotelsListStatus, required this.notificationCount, required this.dataStatus, required this.statusMessage}): _hotelsList = hotelsList;
  

 final  List<Hotel> _hotelsList;
@override List<Hotel> get hotelsList {
  if (_hotelsList is EqualUnmodifiableListView) return _hotelsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotelsList);
}

@override final  Data hotelsListStatus;
@override final  int notificationCount;
@override final  Data dataStatus;
@override final  String statusMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._hotelsList, _hotelsList)&&(identical(other.hotelsListStatus, hotelsListStatus) || other.hotelsListStatus == hotelsListStatus)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.dataStatus, dataStatus) || other.dataStatus == dataStatus)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hotelsList),hotelsListStatus,notificationCount,dataStatus,statusMessage);

@override
String toString() {
  return 'HomeState(hotelsList: $hotelsList, hotelsListStatus: $hotelsListStatus, notificationCount: $notificationCount, dataStatus: $dataStatus, statusMessage: $statusMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<Hotel> hotelsList, Data hotelsListStatus, int notificationCount, Data dataStatus, String statusMessage
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelsList = null,Object? hotelsListStatus = null,Object? notificationCount = null,Object? dataStatus = null,Object? statusMessage = null,}) {
  return _then(_HomeState(
hotelsList: null == hotelsList ? _self._hotelsList : hotelsList // ignore: cast_nullable_to_non_nullable
as List<Hotel>,hotelsListStatus: null == hotelsListStatus ? _self.hotelsListStatus : hotelsListStatus // ignore: cast_nullable_to_non_nullable
as Data,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,dataStatus: null == dataStatus ? _self.dataStatus : dataStatus // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
