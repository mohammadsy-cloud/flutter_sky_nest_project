// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Airport _$AirportFromJson(Map<String, dynamic> json) => _Airport(
  id: (json['airportId'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  avgRating: (json['avgRating'] as num?)?.toDouble(),
  location: json['location'] as String?,
  ratingCount: (json['ratingCount'] as num?)?.toInt(),
  ownerName: json['ownerName'] as String?,
  airportImages:
      (json['airportImages'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AirportToJson(_Airport instance) => <String, dynamic>{
  'airportId': instance.id,
  'name': instance.name,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'avgRating': instance.avgRating,
  'location': instance.location,
  'ratingCount': instance.ratingCount,
  'ownerName': instance.ownerName,
  'airportImages': instance.airportImages,
};
