// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    _EditProfileRequest(
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EditProfileRequestToJson(_EditProfileRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'fullName': instance.fullName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
