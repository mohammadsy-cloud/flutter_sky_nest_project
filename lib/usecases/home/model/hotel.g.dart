// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  address: json['address'] as String?,
  avgRating: (json['avgRating'] as num?)?.toDouble(),
  ratingCount: (json['ratingCount'] as num?)?.toInt(),
  imageDTOList:
      (json['imageDTOList'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'avgRating': instance.avgRating,
  'ratingCount': instance.ratingCount,
  'imageDTOList': instance.imageDTOList,
};
