// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Airport {

@JsonKey(name: 'airportId') int? get id; String? get name; String? get description; double? get latitude; double? get longitude; double? get avgRating; String? get location; int? get ratingCount; String? get ownerName; List<ImageModel>? get airportImages;
/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportCopyWith<Airport> get copyWith => _$AirportCopyWithImpl<Airport>(this as Airport, _$identity);

  /// Serializes this Airport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Airport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.location, location) || other.location == location)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&const DeepCollectionEquality().equals(other.airportImages, airportImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,latitude,longitude,avgRating,location,ratingCount,ownerName,const DeepCollectionEquality().hash(airportImages));

@override
String toString() {
  return 'Airport(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, avgRating: $avgRating, location: $location, ratingCount: $ratingCount, ownerName: $ownerName, airportImages: $airportImages)';
}


}

/// @nodoc
abstract mixin class $AirportCopyWith<$Res>  {
  factory $AirportCopyWith(Airport value, $Res Function(Airport) _then) = _$AirportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'airportId') int? id, String? name, String? description, double? latitude, double? longitude, double? avgRating, String? location, int? ratingCount, String? ownerName, List<ImageModel>? airportImages
});




}
/// @nodoc
class _$AirportCopyWithImpl<$Res>
    implements $AirportCopyWith<$Res> {
  _$AirportCopyWithImpl(this._self, this._then);

  final Airport _self;
  final $Res Function(Airport) _then;

/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? avgRating = freezed,Object? location = freezed,Object? ratingCount = freezed,Object? ownerName = freezed,Object? airportImages = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ratingCount: freezed == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,airportImages: freezed == airportImages ? _self.airportImages : airportImages // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Airport implements Airport {
   _Airport({@JsonKey(name: 'airportId') this.id, this.name, this.description, this.latitude, this.longitude, this.avgRating, this.location, this.ratingCount, this.ownerName, final  List<ImageModel>? airportImages}): _airportImages = airportImages;
  factory _Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);

@override@JsonKey(name: 'airportId') final  int? id;
@override final  String? name;
@override final  String? description;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? avgRating;
@override final  String? location;
@override final  int? ratingCount;
@override final  String? ownerName;
 final  List<ImageModel>? _airportImages;
@override List<ImageModel>? get airportImages {
  final value = _airportImages;
  if (value == null) return null;
  if (_airportImages is EqualUnmodifiableListView) return _airportImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirportCopyWith<_Airport> get copyWith => __$AirportCopyWithImpl<_Airport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Airport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.location, location) || other.location == location)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&const DeepCollectionEquality().equals(other._airportImages, _airportImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,latitude,longitude,avgRating,location,ratingCount,ownerName,const DeepCollectionEquality().hash(_airportImages));

@override
String toString() {
  return 'Airport(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, avgRating: $avgRating, location: $location, ratingCount: $ratingCount, ownerName: $ownerName, airportImages: $airportImages)';
}


}

/// @nodoc
abstract mixin class _$AirportCopyWith<$Res> implements $AirportCopyWith<$Res> {
  factory _$AirportCopyWith(_Airport value, $Res Function(_Airport) _then) = __$AirportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'airportId') int? id, String? name, String? description, double? latitude, double? longitude, double? avgRating, String? location, int? ratingCount, String? ownerName, List<ImageModel>? airportImages
});




}
/// @nodoc
class __$AirportCopyWithImpl<$Res>
    implements _$AirportCopyWith<$Res> {
  __$AirportCopyWithImpl(this._self, this._then);

  final _Airport _self;
  final $Res Function(_Airport) _then;

/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? avgRating = freezed,Object? location = freezed,Object? ratingCount = freezed,Object? ownerName = freezed,Object? airportImages = freezed,}) {
  return _then(_Airport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ratingCount: freezed == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,airportImages: freezed == airportImages ? _self._airportImages : airportImages // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}


}

// dart format on
