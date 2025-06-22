// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_rooms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingRoomsRequest _$BookingRoomsRequestFromJson(Map<String, dynamic> json) =>
    _BookingRoomsRequest(
      numberOfPerson: (json['numberOfPerson'] as num).toInt(),
      numberOfRoom: (json['numberOfRoom'] as num).toInt(),
      roomType: json['roomType'] as String,
      launchDate: DateTime.parse(json['launchDate'] as String),
      departureDate: DateTime.parse(json['departureDate'] as String),
      paymentRatio: (json['paymentRatio'] as num).toInt(),
    );

Map<String, dynamic> _$BookingRoomsRequestToJson(
  _BookingRoomsRequest instance,
) => <String, dynamic>{
  'numberOfPerson': instance.numberOfPerson,
  'numberOfRoom': instance.numberOfRoom,
  'roomType': instance.roomType,
  'launchDate': instance.launchDate.toIso8601String(),
  'departureDate': instance.departureDate.toIso8601String(),
  'paymentRatio': instance.paymentRatio,
};
