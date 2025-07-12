// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reservation {

 int? get bookingId; DateTime? get bookingStartDate; DateTime? get bookingEndDate; String? get bookingType; String? get hotelName; int? get numberOfNights; String? get address; double? get totalCost;@BookingStatusConverter() BookingStatus? get statusBooking;
/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCopyWith<Reservation> get copyWith => _$ReservationCopyWithImpl<Reservation>(this as Reservation, _$identity);

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reservation&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.bookingStartDate, bookingStartDate) || other.bookingStartDate == bookingStartDate)&&(identical(other.bookingEndDate, bookingEndDate) || other.bookingEndDate == bookingEndDate)&&(identical(other.bookingType, bookingType) || other.bookingType == bookingType)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.numberOfNights, numberOfNights) || other.numberOfNights == numberOfNights)&&(identical(other.address, address) || other.address == address)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.statusBooking, statusBooking) || other.statusBooking == statusBooking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,bookingStartDate,bookingEndDate,bookingType,hotelName,numberOfNights,address,totalCost,statusBooking);

@override
String toString() {
  return 'Reservation(bookingId: $bookingId, bookingStartDate: $bookingStartDate, bookingEndDate: $bookingEndDate, bookingType: $bookingType, hotelName: $hotelName, numberOfNights: $numberOfNights, address: $address, totalCost: $totalCost, statusBooking: $statusBooking)';
}


}

/// @nodoc
abstract mixin class $ReservationCopyWith<$Res>  {
  factory $ReservationCopyWith(Reservation value, $Res Function(Reservation) _then) = _$ReservationCopyWithImpl;
@useResult
$Res call({
 int? bookingId, DateTime? bookingStartDate, DateTime? bookingEndDate, String? bookingType, String? hotelName, int? numberOfNights, String? address, double? totalCost,@BookingStatusConverter() BookingStatus? statusBooking
});




}
/// @nodoc
class _$ReservationCopyWithImpl<$Res>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._self, this._then);

  final Reservation _self;
  final $Res Function(Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingId = freezed,Object? bookingStartDate = freezed,Object? bookingEndDate = freezed,Object? bookingType = freezed,Object? hotelName = freezed,Object? numberOfNights = freezed,Object? address = freezed,Object? totalCost = freezed,Object? statusBooking = freezed,}) {
  return _then(_self.copyWith(
bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,bookingStartDate: freezed == bookingStartDate ? _self.bookingStartDate : bookingStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookingEndDate: freezed == bookingEndDate ? _self.bookingEndDate : bookingEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookingType: freezed == bookingType ? _self.bookingType : bookingType // ignore: cast_nullable_to_non_nullable
as String?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,numberOfNights: freezed == numberOfNights ? _self.numberOfNights : numberOfNights // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,statusBooking: freezed == statusBooking ? _self.statusBooking : statusBooking // ignore: cast_nullable_to_non_nullable
as BookingStatus?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Reservation implements Reservation {
   _Reservation({this.bookingId, this.bookingStartDate, this.bookingEndDate, this.bookingType, this.hotelName, this.numberOfNights, this.address, this.totalCost, @BookingStatusConverter() this.statusBooking});
  factory _Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

@override final  int? bookingId;
@override final  DateTime? bookingStartDate;
@override final  DateTime? bookingEndDate;
@override final  String? bookingType;
@override final  String? hotelName;
@override final  int? numberOfNights;
@override final  String? address;
@override final  double? totalCost;
@override@BookingStatusConverter() final  BookingStatus? statusBooking;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCopyWith<_Reservation> get copyWith => __$ReservationCopyWithImpl<_Reservation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reservation&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.bookingStartDate, bookingStartDate) || other.bookingStartDate == bookingStartDate)&&(identical(other.bookingEndDate, bookingEndDate) || other.bookingEndDate == bookingEndDate)&&(identical(other.bookingType, bookingType) || other.bookingType == bookingType)&&(identical(other.hotelName, hotelName) || other.hotelName == hotelName)&&(identical(other.numberOfNights, numberOfNights) || other.numberOfNights == numberOfNights)&&(identical(other.address, address) || other.address == address)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.statusBooking, statusBooking) || other.statusBooking == statusBooking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,bookingStartDate,bookingEndDate,bookingType,hotelName,numberOfNights,address,totalCost,statusBooking);

@override
String toString() {
  return 'Reservation(bookingId: $bookingId, bookingStartDate: $bookingStartDate, bookingEndDate: $bookingEndDate, bookingType: $bookingType, hotelName: $hotelName, numberOfNights: $numberOfNights, address: $address, totalCost: $totalCost, statusBooking: $statusBooking)';
}


}

/// @nodoc
abstract mixin class _$ReservationCopyWith<$Res> implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(_Reservation value, $Res Function(_Reservation) _then) = __$ReservationCopyWithImpl;
@override @useResult
$Res call({
 int? bookingId, DateTime? bookingStartDate, DateTime? bookingEndDate, String? bookingType, String? hotelName, int? numberOfNights, String? address, double? totalCost,@BookingStatusConverter() BookingStatus? statusBooking
});




}
/// @nodoc
class __$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(this._self, this._then);

  final _Reservation _self;
  final $Res Function(_Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingId = freezed,Object? bookingStartDate = freezed,Object? bookingEndDate = freezed,Object? bookingType = freezed,Object? hotelName = freezed,Object? numberOfNights = freezed,Object? address = freezed,Object? totalCost = freezed,Object? statusBooking = freezed,}) {
  return _then(_Reservation(
bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,bookingStartDate: freezed == bookingStartDate ? _self.bookingStartDate : bookingStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookingEndDate: freezed == bookingEndDate ? _self.bookingEndDate : bookingEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookingType: freezed == bookingType ? _self.bookingType : bookingType // ignore: cast_nullable_to_non_nullable
as String?,hotelName: freezed == hotelName ? _self.hotelName : hotelName // ignore: cast_nullable_to_non_nullable
as String?,numberOfNights: freezed == numberOfNights ? _self.numberOfNights : numberOfNights // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,statusBooking: freezed == statusBooking ? _self.statusBooking : statusBooking // ignore: cast_nullable_to_non_nullable
as BookingStatus?,
  ));
}


}

// dart format on
