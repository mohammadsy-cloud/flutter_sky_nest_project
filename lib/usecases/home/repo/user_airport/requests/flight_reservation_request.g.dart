// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_reservation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlightReservationRequest _$FlightReservationRequestFromJson(
  Map<String, dynamic> json,
) => _FlightReservationRequest(
  flightId: (json['flightId'] as num).toInt(),
  numberOfPerson: (json['numberOfPerson'] as num).toInt(),
);

Map<String, dynamic> _$FlightReservationRequestToJson(
  _FlightReservationRequest instance,
) => <String, dynamic>{
  'flightId': instance.flightId,
  'numberOfPerson': instance.numberOfPerson,
};
