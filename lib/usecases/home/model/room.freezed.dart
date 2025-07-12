// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Room {

 int? get id;@JsonKey(name: 'room_type') String? get roomType;@JsonKey(name: 'room_count') int? get roomCount; double? get basePrice; String? get hotelName; String? get ownerName; double? get currentPrice; List<ImageModel>? get imageDTOList; bool? get status;
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCopyWith<Room> get copyWith => _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.roomCount, roomCount) || other.roomCount == roomCount)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&const DeepCollectionEquality().equals(other.imageDTOList, imageDTOList)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomType,roomCount,basePrice,hotelName,ownerName,currentPrice,const DeepCollectionEquality().hash(imageDTOList),status);

@override
String toString() {
  return 'Room(id: $id, roomType: $roomType, roomCount: $roomCount, basePrice: $basePrice, hotelName: $hotelName, ownerName: $ownerName, currentPrice: $currentPrice, imageDTOList: $imageDTOList, status: $status)';
}


}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res>  {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) = _$RoomCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'room_type') String? roomType,@JsonKey(name: 'room_count') int? roomCount, double? basePrice, String? hotelName, String? ownerName, double? currentPrice, List<ImageModel>? imageDTOList, bool? status
});




}
/// @nodoc
class _$RoomCopyWithImpl<$Res>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? roomType = freezed,Object? roomCount = freezed,Object? basePrice = freezed,Object? hotelName = freezed,Object? ownerName = freezed,Object? currentPrice = freezed,Object? imageDTOList = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,roomType: freezed == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String?,roomCount: freezed == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,imageDTOList: freezed == imageDTOList ? _self.imageDTOList : imageDTOList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Room implements Room {
   _Room({this.id, @JsonKey(name: 'room_type') this.roomType, @JsonKey(name: 'room_count') this.roomCount, this.basePrice, this.hotelName, this.ownerName, this.currentPrice, final  List<ImageModel>? imageDTOList, this.status}): _imageDTOList = imageDTOList;
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'room_type') final  String? roomType;
@override@JsonKey(name: 'room_count') final  int? roomCount;
@override final  double? basePrice;
@override final  String? hotelName;
@override final  String? ownerName;
@override final  double? currentPrice;
 final  List<ImageModel>? _imageDTOList;
@override List<ImageModel>? get imageDTOList {
  final value = _imageDTOList;
  if (value == null) return null;
  if (_imageDTOList is EqualUnmodifiableListView) return _imageDTOList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? status;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCopyWith<_Room> get copyWith => __$RoomCopyWithImpl<_Room>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.roomCount, roomCount) || other.roomCount == roomCount)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&const DeepCollectionEquality().equals(other._imageDTOList, _imageDTOList)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomType,roomCount,basePrice,hotelName,ownerName,currentPrice,const DeepCollectionEquality().hash(_imageDTOList),status);

@override
String toString() {
  return 'Room(id: $id, roomType: $roomType, roomCount: $roomCount, basePrice: $basePrice, hotelName: $hotelName, ownerName: $ownerName, currentPrice: $currentPrice, imageDTOList: $imageDTOList, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) = __$RoomCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'room_type') String? roomType,@JsonKey(name: 'room_count') int? roomCount, double? basePrice, String? hotelName, String? ownerName, double? currentPrice, List<ImageModel>? imageDTOList, bool? status
});




}
/// @nodoc
class __$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? roomType = freezed,Object? roomCount = freezed,Object? basePrice = freezed,Object? hotelName = freezed,Object? ownerName = freezed,Object? currentPrice = freezed,Object? imageDTOList = freezed,Object? status = freezed,}) {
  return _then(_Room(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,roomType: freezed == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String?,roomCount: freezed == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int?,basePrice: freezed == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,imageDTOList: freezed == imageDTOList ? _self._imageDTOList : imageDTOList // ignore: cast_nullable_to_non_nullable
as List<ImageModel>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
