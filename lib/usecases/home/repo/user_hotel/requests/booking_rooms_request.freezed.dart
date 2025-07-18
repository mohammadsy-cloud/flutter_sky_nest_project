// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_rooms_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingRoomsRequest {

 int get numberOfPerson; int get numberOfRoom; Set<int>? get setOfRooms; int? get hotelId;@DateOnlyConverter() DateTime get launchDate;@DateOnlyConverter() DateTime get departureDate; int get paymentRatio;
/// Create a copy of BookingRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingRoomsRequestCopyWith<BookingRoomsRequest> get copyWith => _$BookingRoomsRequestCopyWithImpl<BookingRoomsRequest>(this as BookingRoomsRequest, _$identity);

  /// Serializes this BookingRoomsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingRoomsRequest&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson)&&(identical(other.numberOfRoom, numberOfRoom) || other.numberOfRoom == numberOfRoom)&&const DeepCollectionEquality().equals(other.setOfRooms, setOfRooms)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.launchDate, launchDate) || other.launchDate == launchDate)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.paymentRatio, paymentRatio) || other.paymentRatio == paymentRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numberOfPerson,numberOfRoom,const DeepCollectionEquality().hash(setOfRooms),hotelId,launchDate,departureDate,paymentRatio);

@override
String toString() {
  return 'BookingRoomsRequest(numberOfPerson: $numberOfPerson, numberOfRoom: $numberOfRoom, setOfRooms: $setOfRooms, hotelId: $hotelId, launchDate: $launchDate, departureDate: $departureDate, paymentRatio: $paymentRatio)';
}


}

/// @nodoc
abstract mixin class $BookingRoomsRequestCopyWith<$Res>  {
  factory $BookingRoomsRequestCopyWith(BookingRoomsRequest value, $Res Function(BookingRoomsRequest) _then) = _$BookingRoomsRequestCopyWithImpl;
@useResult
$Res call({
 int numberOfPerson, int numberOfRoom, Set<int>? setOfRooms, int? hotelId,@DateOnlyConverter() DateTime launchDate,@DateOnlyConverter() DateTime departureDate, int paymentRatio
});




}
/// @nodoc
class _$BookingRoomsRequestCopyWithImpl<$Res>
    implements $BookingRoomsRequestCopyWith<$Res> {
  _$BookingRoomsRequestCopyWithImpl(this._self, this._then);

  final BookingRoomsRequest _self;
  final $Res Function(BookingRoomsRequest) _then;

/// Create a copy of BookingRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numberOfPerson = null,Object? numberOfRoom = null,Object? setOfRooms = freezed,Object? hotelId = freezed,Object? launchDate = null,Object? departureDate = null,Object? paymentRatio = null,}) {
  return _then(_self.copyWith(
numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,numberOfRoom: null == numberOfRoom ? _self.numberOfRoom : numberOfRoom // ignore: cast_nullable_to_non_nullable
as int,setOfRooms: freezed == setOfRooms ? _self.setOfRooms : setOfRooms // ignore: cast_nullable_to_non_nullable
as Set<int>?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as int?,launchDate: null == launchDate ? _self.launchDate : launchDate // ignore: cast_nullable_to_non_nullable
as DateTime,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,paymentRatio: null == paymentRatio ? _self.paymentRatio : paymentRatio // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookingRoomsRequest implements BookingRoomsRequest {
   _BookingRoomsRequest({required this.numberOfPerson, required this.numberOfRoom, final  Set<int>? setOfRooms, this.hotelId, @DateOnlyConverter() required this.launchDate, @DateOnlyConverter() required this.departureDate, required this.paymentRatio}): _setOfRooms = setOfRooms;
  factory _BookingRoomsRequest.fromJson(Map<String, dynamic> json) => _$BookingRoomsRequestFromJson(json);

@override final  int numberOfPerson;
@override final  int numberOfRoom;
 final  Set<int>? _setOfRooms;
@override Set<int>? get setOfRooms {
  final value = _setOfRooms;
  if (value == null) return null;
  if (_setOfRooms is EqualUnmodifiableSetView) return _setOfRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(value);
}

@override final  int? hotelId;
@override@DateOnlyConverter() final  DateTime launchDate;
@override@DateOnlyConverter() final  DateTime departureDate;
@override final  int paymentRatio;

/// Create a copy of BookingRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingRoomsRequestCopyWith<_BookingRoomsRequest> get copyWith => __$BookingRoomsRequestCopyWithImpl<_BookingRoomsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingRoomsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingRoomsRequest&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson)&&(identical(other.numberOfRoom, numberOfRoom) || other.numberOfRoom == numberOfRoom)&&const DeepCollectionEquality().equals(other._setOfRooms, _setOfRooms)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.launchDate, launchDate) || other.launchDate == launchDate)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.paymentRatio, paymentRatio) || other.paymentRatio == paymentRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numberOfPerson,numberOfRoom,const DeepCollectionEquality().hash(_setOfRooms),hotelId,launchDate,departureDate,paymentRatio);

@override
String toString() {
  return 'BookingRoomsRequest(numberOfPerson: $numberOfPerson, numberOfRoom: $numberOfRoom, setOfRooms: $setOfRooms, hotelId: $hotelId, launchDate: $launchDate, departureDate: $departureDate, paymentRatio: $paymentRatio)';
}


}

/// @nodoc
abstract mixin class _$BookingRoomsRequestCopyWith<$Res> implements $BookingRoomsRequestCopyWith<$Res> {
  factory _$BookingRoomsRequestCopyWith(_BookingRoomsRequest value, $Res Function(_BookingRoomsRequest) _then) = __$BookingRoomsRequestCopyWithImpl;
@override @useResult
$Res call({
 int numberOfPerson, int numberOfRoom, Set<int>? setOfRooms, int? hotelId,@DateOnlyConverter() DateTime launchDate,@DateOnlyConverter() DateTime departureDate, int paymentRatio
});




}
/// @nodoc
class __$BookingRoomsRequestCopyWithImpl<$Res>
    implements _$BookingRoomsRequestCopyWith<$Res> {
  __$BookingRoomsRequestCopyWithImpl(this._self, this._then);

  final _BookingRoomsRequest _self;
  final $Res Function(_BookingRoomsRequest) _then;

/// Create a copy of BookingRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numberOfPerson = null,Object? numberOfRoom = null,Object? setOfRooms = freezed,Object? hotelId = freezed,Object? launchDate = null,Object? departureDate = null,Object? paymentRatio = null,}) {
  return _then(_BookingRoomsRequest(
numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,numberOfRoom: null == numberOfRoom ? _self.numberOfRoom : numberOfRoom // ignore: cast_nullable_to_non_nullable
as int,setOfRooms: freezed == setOfRooms ? _self._setOfRooms : setOfRooms // ignore: cast_nullable_to_non_nullable
as Set<int>?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as int?,launchDate: null == launchDate ? _self.launchDate : launchDate // ignore: cast_nullable_to_non_nullable
as DateTime,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,paymentRatio: null == paymentRatio ? _self.paymentRatio : paymentRatio // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
