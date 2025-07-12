// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_rooms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingRoomsRequest _$BookingRoomsRequestFromJson(Map<String, dynamic> json) =>
    _BookingRoomsRequest(
      numberOfPerson: (json['numberOfPerson'] as num).toInt(),
      numberOfRoom: (json['numberOfRoom'] as num).toInt(),
      setOfRooms:
          (json['setOfRooms'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet(),
      hotelId: (json['hotelId'] as num?)?.toInt(),
      launchDate: const DateOnlyConverter().fromJson(
        json['launchDate'] as String,
      ),
      departureDate: const DateOnlyConverter().fromJson(
        json['departureDate'] as String,
      ),
      paymentRatio: (json['paymentRatio'] as num).toInt(),
    );

Map<String, dynamic> _$BookingRoomsRequestToJson(
  _BookingRoomsRequest instance,
) => <String, dynamic>{
  'numberOfPerson': instance.numberOfPerson,
  'numberOfRoom': instance.numberOfRoom,
  'setOfRooms': instance.setOfRooms?.toList(),
  'hotelId': instance.hotelId,
  'launchDate': const DateOnlyConverter().toJson(instance.launchDate),
  'departureDate': const DateOnlyConverter().toJson(instance.departureDate),
  'paymentRatio': instance.paymentRatio,
};
