// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_places_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelPlacesState {

 List<Place> get hotelPlaces; Data get status; String get statusMessage;
/// Create a copy of HotelPlacesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelPlacesStateCopyWith<HotelPlacesState> get copyWith => _$HotelPlacesStateCopyWithImpl<HotelPlacesState>(this as HotelPlacesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelPlacesState&&const DeepCollectionEquality().equals(other.hotelPlaces, hotelPlaces)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hotelPlaces),status,statusMessage);

@override
String toString() {
  return 'HotelPlacesState(hotelPlaces: $hotelPlaces, status: $status, statusMessage: $statusMessage)';
}


}

/// @nodoc
abstract mixin class $HotelPlacesStateCopyWith<$Res>  {
  factory $HotelPlacesStateCopyWith(HotelPlacesState value, $Res Function(HotelPlacesState) _then) = _$HotelPlacesStateCopyWithImpl;
@useResult
$Res call({
 List<Place> hotelPlaces, Data status, String statusMessage
});




}
/// @nodoc
class _$HotelPlacesStateCopyWithImpl<$Res>
    implements $HotelPlacesStateCopyWith<$Res> {
  _$HotelPlacesStateCopyWithImpl(this._self, this._then);

  final HotelPlacesState _self;
  final $Res Function(HotelPlacesState) _then;

/// Create a copy of HotelPlacesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelPlaces = null,Object? status = null,Object? statusMessage = null,}) {
  return _then(_self.copyWith(
hotelPlaces: null == hotelPlaces ? _self.hotelPlaces : hotelPlaces // ignore: cast_nullable_to_non_nullable
as List<Place>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _HotelPlacesState implements HotelPlacesState {
  const _HotelPlacesState({required final  List<Place> hotelPlaces, required this.status, required this.statusMessage}): _hotelPlaces = hotelPlaces;
  

 final  List<Place> _hotelPlaces;
@override List<Place> get hotelPlaces {
  if (_hotelPlaces is EqualUnmodifiableListView) return _hotelPlaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotelPlaces);
}

@override final  Data status;
@override final  String statusMessage;

/// Create a copy of HotelPlacesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelPlacesStateCopyWith<_HotelPlacesState> get copyWith => __$HotelPlacesStateCopyWithImpl<_HotelPlacesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelPlacesState&&const DeepCollectionEquality().equals(other._hotelPlaces, _hotelPlaces)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hotelPlaces),status,statusMessage);

@override
String toString() {
  return 'HotelPlacesState(hotelPlaces: $hotelPlaces, status: $status, statusMessage: $statusMessage)';
}


}

/// @nodoc
abstract mixin class _$HotelPlacesStateCopyWith<$Res> implements $HotelPlacesStateCopyWith<$Res> {
  factory _$HotelPlacesStateCopyWith(_HotelPlacesState value, $Res Function(_HotelPlacesState) _then) = __$HotelPlacesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Place> hotelPlaces, Data status, String statusMessage
});




}
/// @nodoc
class __$HotelPlacesStateCopyWithImpl<$Res>
    implements _$HotelPlacesStateCopyWith<$Res> {
  __$HotelPlacesStateCopyWithImpl(this._self, this._then);

  final _HotelPlacesState _self;
  final $Res Function(_HotelPlacesState) _then;

/// Create a copy of HotelPlacesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelPlaces = null,Object? status = null,Object? statusMessage = null,}) {
  return _then(_HotelPlacesState(
hotelPlaces: null == hotelPlaces ? _self._hotelPlaces : hotelPlaces // ignore: cast_nullable_to_non_nullable
as List<Place>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
