// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reservation _$ReservationFromJson(Map<String, dynamic> json) => _Reservation(
  bookingId: (json['bookingId'] as num?)?.toInt(),
  bookingStartDate:
      json['bookingStartDate'] == null
          ? null
          : DateTime.parse(json['bookingStartDate'] as String),
  bookingEndDate:
      json['bookingEndDate'] == null
          ? null
          : DateTime.parse(json['bookingEndDate'] as String),
  bookingType: json['bookingType'] as String?,
  hotelName: json['hotelName'] as String?,
  numberOfNights: (json['numberOfNights'] as num?)?.toInt(),
  address: json['address'] as String?,
  totalCost: (json['totalCost'] as num?)?.toDouble(),
  statusBooking: _$JsonConverterFromJson<String, BookingStatus>(
    json['statusBooking'],
    const BookingStatusConverter().fromJson,
  ),
);

Map<String, dynamic> _$ReservationToJson(_Reservation instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'bookingStartDate': instance.bookingStartDate?.toIso8601String(),
      'bookingEndDate': instance.bookingEndDate?.toIso8601String(),
      'bookingType': instance.bookingType,
      'hotelName': instance.hotelName,
      'numberOfNights': instance.numberOfNights,
      'address': instance.address,
      'totalCost': instance.totalCost,
      'statusBooking': _$JsonConverterToJson<String, BookingStatus>(
        instance.statusBooking,
        const BookingStatusConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
