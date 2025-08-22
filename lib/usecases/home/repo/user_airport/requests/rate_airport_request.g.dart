// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_airport_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateAirportRequest _$RateAirportRequestFromJson(Map<String, dynamic> json) =>
    _RateAirportRequest(
      airportId: (json['airportId'] as num).toInt(),
      stars: (json['stars'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$RateAirportRequestToJson(_RateAirportRequest instance) =>
    <String, dynamic>{
      'airportId': instance.airportId,
      'stars': instance.stars,
      'comment': instance.comment,
    };
