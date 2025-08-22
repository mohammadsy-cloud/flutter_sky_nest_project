// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_flights_by_date_and_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchFlightsByDateAndLocationRequest
_$SearchFlightsByDateAndLocationRequestFromJson(Map<String, dynamic> json) =>
    _SearchFlightsByDateAndLocationRequest(
      startPoint: json['startPoint'] as String,
      destination: json['destination'] as String,
      userDate: const DateOnlyConverter().fromJson(json['userDate'] as String),
    );

Map<String, dynamic> _$SearchFlightsByDateAndLocationRequestToJson(
  _SearchFlightsByDateAndLocationRequest instance,
) => <String, dynamic>{
  'startPoint': instance.startPoint,
  'destination': instance.destination,
  'userDate': const DateOnlyConverter().toJson(instance.userDate),
};
