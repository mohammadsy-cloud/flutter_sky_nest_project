// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: (json['id'] as num?)?.toInt(),
  roomType: json['room_type'] as String?,
  roomCount: (json['room_count'] as num?)?.toInt(),
  basePrice: (json['basePrice'] as num?)?.toDouble(),
  hotelName: json['hotelName'] as String?,
  ownerName: json['ownerName'] as String?,
  currentPrice: (json['currentPrice'] as num?)?.toDouble(),
  imageDTOList:
      (json['imageDTOList'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as bool?,
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'room_type': instance.roomType,
  'room_count': instance.roomCount,
  'basePrice': instance.basePrice,
  'hotelName': instance.hotelName,
  'ownerName': instance.ownerName,
  'currentPrice': instance.currentPrice,
  'imageDTOList': instance.imageDTOList,
  'status': instance.status,
};
