// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
  placeId: (json['placeId'] as num?)?.toInt(),
  placeName: json['placeName'] as String?,
  placeDescription: json['placeDescription'] as String?,
  imagePlaceList:
      (json['imagePlaceList'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'placeId': instance.placeId,
  'placeName': instance.placeName,
  'placeDescription': instance.placeDescription,
  'imagePlaceList': instance.imagePlaceList,
};
