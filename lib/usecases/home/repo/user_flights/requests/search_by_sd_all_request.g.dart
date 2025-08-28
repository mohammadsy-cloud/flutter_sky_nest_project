// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_by_sd_all_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchBySdAllRequest _$SearchBySdAllRequestFromJson(
  Map<String, dynamic> json,
) => _SearchBySdAllRequest(
  startPoint: json['startPoint'] as String?,
  destination: json['destination'] as String?,
);

Map<String, dynamic> _$SearchBySdAllRequestToJson(
  _SearchBySdAllRequest instance,
) => <String, dynamic>{
  if (instance.startPoint case final value?) 'startPoint': value,
  if (instance.destination case final value?) 'destination': value,
};
