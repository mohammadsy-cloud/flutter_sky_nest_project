// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Flight _$FlightFromJson(Map<String, dynamic> json) => _Flight(
  id: (json['id'] as num?)?.toInt(),
  startingPoint: json['startingPoint'] as String?,
  destination: json['destination'] as String?,
  status: json['status'] as String?,
  destinationDate:
      json['destinationDate'] == null
          ? null
          : DateTime.parse(json['destinationDate'] as String),
  startingPointDate:
      json['startingPointDate'] == null
          ? null
          : DateTime.parse(json['startingPointDate'] as String),
  numberOfChairs: (json['numberOfChairs'] as num?)?.toInt(),
  numberOfEmptyChairs: (json['numberOfEmptyChairs'] as num?)?.toInt(),
  tripType: json['tripType'] as String?,
  airportName: json['airportName'] as String?,
  basePrice: (json['basePrice'] as num?)?.toDouble(),
  currentPrice: (json['currentPrice'] as num?)?.toDouble(),
  flightStatus: json['flightStatus'] as String?,
  flightImage:
      (json['flightImage'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FlightToJson(_Flight instance) => <String, dynamic>{
  'id': instance.id,
  'startingPoint': instance.startingPoint,
  'destination': instance.destination,
  'status': instance.status,
  'destinationDate': instance.destinationDate?.toIso8601String(),
  'startingPointDate': instance.startingPointDate?.toIso8601String(),
  'numberOfChairs': instance.numberOfChairs,
  'numberOfEmptyChairs': instance.numberOfEmptyChairs,
  'tripType': instance.tripType,
  'airportName': instance.airportName,
  'basePrice': instance.basePrice,
  'currentPrice': instance.currentPrice,
  'flightStatus': instance.flightStatus,
  'flightImage': instance.flightImage,
};
