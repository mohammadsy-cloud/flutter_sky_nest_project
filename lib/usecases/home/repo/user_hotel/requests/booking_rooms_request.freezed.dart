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

 int get numberOfPerson; int get numberOfRoom; String get roomType; DateTime get launchDate; DateTime get departureDate; int get paymentRatio;
/// Create a copy of BookingRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingRoomsRequestCopyWith<BookingRoomsRequest> get copyWith => _$BookingRoomsRequestCopyWithImpl<BookingRoomsRequest>(this as BookingRoomsRequest, _$identity);

  /// Serializes this BookingRoomsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingRoomsRequest&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson)&&(identical(other.numberOfRoom, numberOfRoom) || other.numberOfRoom == numberOfRoom)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.launchDate, launchDate) || other.launchDate == launchDate)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.paymentRatio, paymentRatio) || other.paymentRatio == paymentRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numberOfPerson,numberOfRoom,roomType,launchDate,departureDate,paymentRatio);

@override
String toString() {
  return 'BookingRoomsRequest(numberOfPerson: $numberOfPerson, numberOfRoom: $numberOfRoom, roomType: $roomType, launchDate: $launchDate, departureDate: $departureDate, paymentRatio: $paymentRatio)';
}


}

/// @nodoc
abstract mixin class $BookingRoomsRequestCopyWith<$Res>  {
  factory $BookingRoomsRequestCopyWith(BookingRoomsRequest value, $Res Function(BookingRoomsRequest) _then) = _$BookingRoomsRequestCopyWithImpl;
@useResult
$Res call({
 int numberOfPerson, int numberOfRoom, String roomType, DateTime launchDate, DateTime departureDate, int paymentRatio
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
@pragma('vm:prefer-inline') @override $Res call({Object? numberOfPerson = null,Object? numberOfRoom = null,Object? roomType = null,Object? launchDate = null,Object? departureDate = null,Object? paymentRatio = null,}) {
  return _then(_self.copyWith(
numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,numberOfRoom: null == numberOfRoom ? _self.numberOfRoom : numberOfRoom // ignore: cast_nullable_to_non_nullable
as int,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,launchDate: null == launchDate ? _self.launchDate : launchDate // ignore: cast_nullable_to_non_nullable
as DateTime,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,paymentRatio: null == paymentRatio ? _self.paymentRatio : paymentRatio // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookingRoomsRequest implements BookingRoomsRequest {
   _BookingRoomsRequest({required this.numberOfPerson, required this.numberOfRoom, required this.roomType, required this.launchDate, required this.departureDate, required this.paymentRatio});
  factory _BookingRoomsRequest.fromJson(Map<String, dynamic> json) => _$BookingRoomsRequestFromJson(json);

@override final  int numberOfPerson;
@override final  int numberOfRoom;
@override final  String roomType;
@override final  DateTime launchDate;
@override final  DateTime departureDate;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingRoomsRequest&&(identical(other.numberOfPerson, numberOfPerson) || other.numberOfPerson == numberOfPerson)&&(identical(other.numberOfRoom, numberOfRoom) || other.numberOfRoom == numberOfRoom)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.launchDate, launchDate) || other.launchDate == launchDate)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.paymentRatio, paymentRatio) || other.paymentRatio == paymentRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numberOfPerson,numberOfRoom,roomType,launchDate,departureDate,paymentRatio);

@override
String toString() {
  return 'BookingRoomsRequest(numberOfPerson: $numberOfPerson, numberOfRoom: $numberOfRoom, roomType: $roomType, launchDate: $launchDate, departureDate: $departureDate, paymentRatio: $paymentRatio)';
}


}

/// @nodoc
abstract mixin class _$BookingRoomsRequestCopyWith<$Res> implements $BookingRoomsRequestCopyWith<$Res> {
  factory _$BookingRoomsRequestCopyWith(_BookingRoomsRequest value, $Res Function(_BookingRoomsRequest) _then) = __$BookingRoomsRequestCopyWithImpl;
@override @useResult
$Res call({
 int numberOfPerson, int numberOfRoom, String roomType, DateTime launchDate, DateTime departureDate, int paymentRatio
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
@override @pragma('vm:prefer-inline') $Res call({Object? numberOfPerson = null,Object? numberOfRoom = null,Object? roomType = null,Object? launchDate = null,Object? departureDate = null,Object? paymentRatio = null,}) {
  return _then(_BookingRoomsRequest(
numberOfPerson: null == numberOfPerson ? _self.numberOfPerson : numberOfPerson // ignore: cast_nullable_to_non_nullable
as int,numberOfRoom: null == numberOfRoom ? _self.numberOfRoom : numberOfRoom // ignore: cast_nullable_to_non_nullable
as int,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,launchDate: null == launchDate ? _self.launchDate : launchDate // ignore: cast_nullable_to_non_nullable
as DateTime,departureDate: null == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime,paymentRatio: null == paymentRatio ? _self.paymentRatio : paymentRatio // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
