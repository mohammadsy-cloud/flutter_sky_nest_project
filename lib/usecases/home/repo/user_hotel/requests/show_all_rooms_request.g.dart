// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_all_rooms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShowAllRoomsRequest _$ShowAllRoomsRequestFromJson(Map<String, dynamic> json) =>
    _ShowAllRoomsRequest(
      address: json['address'] as String,
      startDate: _$JsonConverterFromJson<String, DateTime>(
        json['startDate'],
        const DateOnlyConverter().fromJson,
      ),
      endDate: _$JsonConverterFromJson<String, DateTime>(
        json['endDate'],
        const DateOnlyConverter().fromJson,
      ),
    );

Map<String, dynamic> _$ShowAllRoomsRequestToJson(
  _ShowAllRoomsRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'startDate': _$JsonConverterToJson<String, DateTime>(
    instance.startDate,
    const DateOnlyConverter().toJson,
  ),
  'endDate': _$JsonConverterToJson<String, DateTime>(
    instance.endDate,
    const DateOnlyConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
