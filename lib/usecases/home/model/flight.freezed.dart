// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Flight {

 int? get id; String? get startingPoint; String? get destination; String? get status; DateTime? get destinationDate; DateTime? get startingPointDate; int? get numberOfChairs; int? get numberOfEmptyChairs; String? get tripType; String? get airportName; double? get basePrice; double? get currentPrice; String? get flightStatus; List<ImageModel>? get flightImage;
/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightCopyWith<Flight> get copyWith => _$FlightCopyWithImpl<Flight>(this as Flight, _$identity);

  /// Serializes this Flight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flight&&(identical(other.id, id) || other.id == id)&&(identical(other.startingPoint, startingPoint) || other.startingPoint == startingPoint)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.status, status) || other.status == status)&&(identical(other.destinationDate, destinationDate) || other.destinationDate == destinationDate)&&(identical(other.startingPointDate, startingPointDate) || other.startingPointDate == startingPointDate)&&(identical(other.numberOfChairs, numberOfChairs) || other.numberOfChairs == numberOfChairs)&&(identical(other.numberOfEmptyChairs, numberOfEmptyChairs) || other.numberOfEmptyChairs == numberOfEmptyChairs)&&(identical(other.tripType, tripType) || other.tripType == tripType)&&(identical(other.airportName, airportName) || other.airportName == airportName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.flightStatus, flightStatus) || other.flightStatus == flightStatus)&&const DeepCollectionEquality().equals(other.flightImage, flightImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startingPoint,destination,status,destinationDate,startingPointDate,numberOfChairs,numberOfEmptyChairs,tripType,airportName,basePrice,currentPrice,flightStatus,const DeepCollectionEquality().hash(flightImage));

@override
String toString() {
  return 'Flight(id: $id, startingPoint: $startingPoint, destination: $destination, status: $status, destinationDate: $destinationDate, startingPointDate: $startingPointDate, numberOfChairs: $numberOfChairs, numberOfEmptyChairs: $numberOfEmptyChairs, tripType: $tripType, airportName: $airportName, basePrice: $basePrice, currentPrice: $currentPrice, flightStatus: $flightStatus, flightImage: $flightImage)';
}


}

/// @nodoc
abstract mixin class $FlightCopyWith<$Res>  {
  factory $FlightCopyWith(Flight value, $Res Function(Flight) _then) = _$FlightCopyWithImpl;
@useResult
$Res call({
 int? id, String? startingPoint, String? destination, String? status, DateTime? destinationDate, DateTime? startingPointDate, int? numberOfChairs, int? numberOfEmptyChairs, String? tripType, String? airportName, double? basePrice, double? currentPrice, String? flightStatus, List<ImageModel>? flightImage
});




}
/// @nodoc
class _$FlightCopyWithImpl<$Res>
    implements $FlightCopyWith<$Res> {
  _$FlightCopyWithImpl(this._self, this._then);

  final Flight _self;
  final $Res Function(Flight) _then;

/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startingPoint = freezed,Object? destination = freezed,Object? status = freezed,Object? destinationDate = freezed,Object? startingPointDate = freezed,Object? numberOfChairs = freezed,Object? numberOfEmptyChairs = freezed,Object? tripType = freezed,Object? airportName = freezed,Object? basePrice = freezed,Object? currentPrice = freezed,Object? flightStatus = freezed,Object? flightImage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startingPoint: freezed == startingPoint ? _self.startingPoint : startingPoint // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,destinationDate: freezed == destinationDate ? _self.destinationDate : destinationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startingPointDate: freezed == startingPointDate ? _self.startingPointDate : startingPointDate // ignore: cast_nullable_to_non_nullable
as DateTime?,numberOfChairs: freezed == numberOfChairs ? _self.numberOfChairs : numberOfChairs // ignore: cast_nullable_to_non_nullable
as int?,numberOfEmptyChairs: freezed == numberOfEmptyChairs ? _self.numberOfEmptyChairs : numberOfEmptyChairs // ignore: cast_nullable_to_non_nullable
as int?,tripType: freezed == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as String?,airportName: freezed == airportName ? _self.airportName : airportName // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,flightStatus: freezed == flightStatus ? _self.flightStatus : flightStatus // ignore: cast_nullable_to_non_nullable
as String?,flightImage: freezed == flightImage ? _self.flightImage : flightImage // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Flight implements Flight {
   _Flight({this.id, this.startingPoint, this.destination, this.status, this.destinationDate, this.startingPointDate, this.numberOfChairs, this.numberOfEmptyChairs, this.tripType, this.airportName, this.basePrice, this.currentPrice, this.flightStatus, final  List<ImageModel>? flightImage}): _flightImage = flightImage;
  factory _Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);

@override final  int? id;
@override final  String? startingPoint;
@override final  String? destination;
@override final  String? status;
@override final  DateTime? destinationDate;
@override final  DateTime? startingPointDate;
@override final  int? numberOfChairs;
@override final  int? numberOfEmptyChairs;
@override final  String? tripType;
@override final  String? airportName;
@override final  double? basePrice;
@override final  double? currentPrice;
@override final  String? flightStatus;
 final  List<ImageModel>? _flightImage;
@override List<ImageModel>? get flightImage {
  final value = _flightImage;
  if (value == null) return null;
  if (_flightImage is EqualUnmodifiableListView) return _flightImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightCopyWith<_Flight> get copyWith => __$FlightCopyWithImpl<_Flight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flight&&(identical(other.id, id) || other.id == id)&&(identical(other.startingPoint, startingPoint) || other.startingPoint == startingPoint)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.status, status) || other.status == status)&&(identical(other.destinationDate, destinationDate) || other.destinationDate == destinationDate)&&(identical(other.startingPointDate, startingPointDate) || other.startingPointDate == startingPointDate)&&(identical(other.numberOfChairs, numberOfChairs) || other.numberOfChairs == numberOfChairs)&&(identical(other.numberOfEmptyChairs, numberOfEmptyChairs) || other.numberOfEmptyChairs == numberOfEmptyChairs)&&(identical(other.tripType, tripType) || other.tripType == tripType)&&(identical(other.airportName, airportName) || other.airportName == airportName)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.flightStatus, flightStatus) || other.flightStatus == flightStatus)&&const DeepCollectionEquality().equals(other._flightImage, _flightImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startingPoint,destination,status,destinationDate,startingPointDate,numberOfChairs,numberOfEmptyChairs,tripType,airportName,basePrice,currentPrice,flightStatus,const DeepCollectionEquality().hash(_flightImage));

@override
String toString() {
  return 'Flight(id: $id, startingPoint: $startingPoint, destination: $destination, status: $status, destinationDate: $destinationDate, startingPointDate: $startingPointDate, numberOfChairs: $numberOfChairs, numberOfEmptyChairs: $numberOfEmptyChairs, tripType: $tripType, airportName: $airportName, basePrice: $basePrice, currentPrice: $currentPrice, flightStatus: $flightStatus, flightImage: $flightImage)';
}


}

/// @nodoc
abstract mixin class _$FlightCopyWith<$Res> implements $FlightCopyWith<$Res> {
  factory _$FlightCopyWith(_Flight value, $Res Function(_Flight) _then) = __$FlightCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? startingPoint, String? destination, String? status, DateTime? destinationDate, DateTime? startingPointDate, int? numberOfChairs, int? numberOfEmptyChairs, String? tripType, String? airportName, double? basePrice, double? currentPrice, String? flightStatus, List<ImageModel>? flightImage
});




}
/// @nodoc
class __$FlightCopyWithImpl<$Res>
    implements _$FlightCopyWith<$Res> {
  __$FlightCopyWithImpl(this._self, this._then);

  final _Flight _self;
  final $Res Function(_Flight) _then;

/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startingPoint = freezed,Object? destination = freezed,Object? status = freezed,Object? destinationDate = freezed,Object? startingPointDate = freezed,Object? numberOfChairs = freezed,Object? numberOfEmptyChairs = freezed,Object? tripType = freezed,Object? airportName = freezed,Object? basePrice = freezed,Object? currentPrice = freezed,Object? flightStatus = freezed,Object? flightImage = freezed,}) {
  return _then(_Flight(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,startingPoint: freezed == startingPoint ? _self.startingPoint : startingPoint // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,destinationDate: freezed == destinationDate ? _self.destinationDate : destinationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startingPointDate: freezed == startingPointDate ? _self.startingPointDate : startingPointDate // ignore: cast_nullable_to_non_nullable
as DateTime?,numberOfChairs: freezed == numberOfChairs ? _self.numberOfChairs : numberOfChairs // ignore: cast_nullable_to_non_nullable
as int?,numberOfEmptyChairs: freezed == numberOfEmptyChairs ? _self.numberOfEmptyChairs : numberOfEmptyChairs // ignore: cast_nullable_to_non_nullable
as int?,tripType: freezed == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as String?,airportName: freezed == airportName ? _self.airportName : airportName // ignore: cast_nullable_to_non_nullable
as String?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,flightStatus: freezed == flightStatus ? _self.flightStatus : flightStatus // ignore: cast_nullable_to_non_nullable
as String?,flightImage: freezed == flightImage ? _self._flightImage : flightImage // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,
  ));
}


}

// dart format on
