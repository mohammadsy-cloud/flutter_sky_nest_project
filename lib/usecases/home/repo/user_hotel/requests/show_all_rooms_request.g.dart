// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_all_rooms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShowAllRoomsRequest _$ShowAllRoomsRequestFromJson(Map<String, dynamic> json) =>
    _ShowAllRoomsRequest(
      address: json['address'] as String,
      startDate: const DateOnlyConverter().fromJson(
        json['startDate'] as String,
      ),
      endDate: const DateOnlyConverter().fromJson(json['endDate'] as String),
    );

Map<String, dynamic> _$ShowAllRoomsRequestToJson(
  _ShowAllRoomsRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'startDate': const DateOnlyConverter().toJson(instance.startDate),
  'endDate': const DateOnlyConverter().toJson(instance.endDate),
};
