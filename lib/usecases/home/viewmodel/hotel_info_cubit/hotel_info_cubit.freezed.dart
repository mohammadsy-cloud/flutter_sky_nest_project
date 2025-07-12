// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelInfoState {

 Hotel get hotel; Data get status; String get statusMessage; List<String> get nearbyPlacesPhotos; Data get nearbyPlacesPhotosStatus;
/// Create a copy of HotelInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelInfoStateCopyWith<HotelInfoState> get copyWith => _$HotelInfoStateCopyWithImpl<HotelInfoState>(this as HotelInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelInfoState&&(identical(other.hotel, hotel) || other.hotel == hotel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other.nearbyPlacesPhotos, nearbyPlacesPhotos)&&(identical(other.nearbyPlacesPhotosStatus, nearbyPlacesPhotosStatus) || other.nearbyPlacesPhotosStatus == nearbyPlacesPhotosStatus));
}


@override
int get hashCode => Object.hash(runtimeType,hotel,status,statusMessage,const DeepCollectionEquality().hash(nearbyPlacesPhotos),nearbyPlacesPhotosStatus);

@override
String toString() {
  return 'HotelInfoState(hotel: $hotel, status: $status, statusMessage: $statusMessage, nearbyPlacesPhotos: $nearbyPlacesPhotos, nearbyPlacesPhotosStatus: $nearbyPlacesPhotosStatus)';
}


}

/// @nodoc
abstract mixin class $HotelInfoStateCopyWith<$Res>  {
  factory $HotelInfoStateCopyWith(HotelInfoState value, $Res Function(HotelInfoState) _then) = _$HotelInfoStateCopyWithImpl;
@useResult
$Res call({
 Hotel hotel, Data status, String statusMessage, List<String> nearbyPlacesPhotos, Data nearbyPlacesPhotosStatus
});


$HotelCopyWith<$Res> get hotel;

}
/// @nodoc
class _$HotelInfoStateCopyWithImpl<$Res>
    implements $HotelInfoStateCopyWith<$Res> {
  _$HotelInfoStateCopyWithImpl(this._self, this._then);

  final HotelInfoState _self;
  final $Res Function(HotelInfoState) _then;

/// Create a copy of HotelInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotel = null,Object? status = null,Object? statusMessage = null,Object? nearbyPlacesPhotos = null,Object? nearbyPlacesPhotosStatus = null,}) {
  return _then(_self.copyWith(
hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,nearbyPlacesPhotos: null == nearbyPlacesPhotos ? _self.nearbyPlacesPhotos : nearbyPlacesPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,nearbyPlacesPhotosStatus: null == nearbyPlacesPhotosStatus ? _self.nearbyPlacesPhotosStatus : nearbyPlacesPhotosStatus // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}
/// Create a copy of HotelInfoState
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


class _HotelInfoState implements HotelInfoState {
  const _HotelInfoState({required this.hotel, required this.status, required this.statusMessage, required final  List<String> nearbyPlacesPhotos, required this.nearbyPlacesPhotosStatus}): _nearbyPlacesPhotos = nearbyPlacesPhotos;
  

@override final  Hotel hotel;
@override final  Data status;
@override final  String statusMessage;
 final  List<String> _nearbyPlacesPhotos;
@override List<String> get nearbyPlacesPhotos {
  if (_nearbyPlacesPhotos is EqualUnmodifiableListView) return _nearbyPlacesPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearbyPlacesPhotos);
}

@override final  Data nearbyPlacesPhotosStatus;

/// Create a copy of HotelInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelInfoStateCopyWith<_HotelInfoState> get copyWith => __$HotelInfoStateCopyWithImpl<_HotelInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelInfoState&&(identical(other.hotel, hotel) || other.hotel == hotel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other._nearbyPlacesPhotos, _nearbyPlacesPhotos)&&(identical(other.nearbyPlacesPhotosStatus, nearbyPlacesPhotosStatus) || other.nearbyPlacesPhotosStatus == nearbyPlacesPhotosStatus));
}


@override
int get hashCode => Object.hash(runtimeType,hotel,status,statusMessage,const DeepCollectionEquality().hash(_nearbyPlacesPhotos),nearbyPlacesPhotosStatus);

@override
String toString() {
  return 'HotelInfoState(hotel: $hotel, status: $status, statusMessage: $statusMessage, nearbyPlacesPhotos: $nearbyPlacesPhotos, nearbyPlacesPhotosStatus: $nearbyPlacesPhotosStatus)';
}


}

/// @nodoc
abstract mixin class _$HotelInfoStateCopyWith<$Res> implements $HotelInfoStateCopyWith<$Res> {
  factory _$HotelInfoStateCopyWith(_HotelInfoState value, $Res Function(_HotelInfoState) _then) = __$HotelInfoStateCopyWithImpl;
@override @useResult
$Res call({
 Hotel hotel, Data status, String statusMessage, List<String> nearbyPlacesPhotos, Data nearbyPlacesPhotosStatus
});


@override $HotelCopyWith<$Res> get hotel;

}
/// @nodoc
class __$HotelInfoStateCopyWithImpl<$Res>
    implements _$HotelInfoStateCopyWith<$Res> {
  __$HotelInfoStateCopyWithImpl(this._self, this._then);

  final _HotelInfoState _self;
  final $Res Function(_HotelInfoState) _then;

/// Create a copy of HotelInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotel = null,Object? status = null,Object? statusMessage = null,Object? nearbyPlacesPhotos = null,Object? nearbyPlacesPhotosStatus = null,}) {
  return _then(_HotelInfoState(
hotel: null == hotel ? _self.hotel : hotel // ignore: cast_nullable_to_non_nullable
as Hotel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,nearbyPlacesPhotos: null == nearbyPlacesPhotos ? _self._nearbyPlacesPhotos : nearbyPlacesPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,nearbyPlacesPhotosStatus: null == nearbyPlacesPhotosStatus ? _self.nearbyPlacesPhotosStatus : nearbyPlacesPhotosStatus // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}

/// Create a copy of HotelInfoState
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
