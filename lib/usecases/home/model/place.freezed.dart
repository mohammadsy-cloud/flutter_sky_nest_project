// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Place {

 int? get placeId; String? get placeName; String? get placeDescription; List<ImageModel>? get imagePlaceList;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Place&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeDescription, placeDescription) || other.placeDescription == placeDescription)&&const DeepCollectionEquality().equals(other.imagePlaceList, imagePlaceList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,placeName,placeDescription,const DeepCollectionEquality().hash(imagePlaceList));

@override
String toString() {
  return 'Place(placeId: $placeId, placeName: $placeName, placeDescription: $placeDescription, imagePlaceList: $imagePlaceList)';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
 int? placeId, String? placeName, String? placeDescription, List<ImageModel>? imagePlaceList
});




}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = freezed,Object? placeName = freezed,Object? placeDescription = freezed,Object? imagePlaceList = freezed,}) {
  return _then(_self.copyWith(
placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as int?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeDescription: freezed == placeDescription ? _self.placeDescription : placeDescription // ignore: cast_nullable_to_non_nullable
as String?,imagePlaceList: freezed == imagePlaceList ? _self.imagePlaceList : imagePlaceList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Place implements Place {
   _Place({this.placeId, this.placeName, this.placeDescription, final  List<ImageModel>? imagePlaceList}): _imagePlaceList = imagePlaceList;
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

@override final  int? placeId;
@override final  String? placeName;
@override final  String? placeDescription;
 final  List<ImageModel>? _imagePlaceList;
@override List<ImageModel>? get imagePlaceList {
  final value = _imagePlaceList;
  if (value == null) return null;
  if (_imagePlaceList is EqualUnmodifiableListView) return _imagePlaceList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Place&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeDescription, placeDescription) || other.placeDescription == placeDescription)&&const DeepCollectionEquality().equals(other._imagePlaceList, _imagePlaceList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,placeName,placeDescription,const DeepCollectionEquality().hash(_imagePlaceList));

@override
String toString() {
  return 'Place(placeId: $placeId, placeName: $placeName, placeDescription: $placeDescription, imagePlaceList: $imagePlaceList)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
 int? placeId, String? placeName, String? placeDescription, List<ImageModel>? imagePlaceList
});




}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = freezed,Object? placeName = freezed,Object? placeDescription = freezed,Object? imagePlaceList = freezed,}) {
  return _then(_Place(
placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as int?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeDescription: freezed == placeDescription ? _self.placeDescription : placeDescription // ignore: cast_nullable_to_non_nullable
as String?,imagePlaceList: freezed == imagePlaceList ? _self._imagePlaceList : imagePlaceList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}


}

// dart format on
