import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';

import '../../../../../common/utilities/date_only_converter.dart';
import '../../../model/room.dart';

part 'booking_rooms_request.freezed.dart';
part 'booking_rooms_request.g.dart';

@freezed
sealed class BookingRoomsRequest with _$BookingRoomsRequest {
  factory BookingRoomsRequest({
    required int numberOfPerson,
    required int numberOfRoom,
    Set<int>? setOfRooms,
    int? hotelId,
    @DateOnlyConverter() required DateTime launchDate,
    @DateOnlyConverter() required DateTime departureDate,
    required int paymentRatio,
  }) = _BookingRoomsRequest;

  factory BookingRoomsRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRoomsRequestFromJson(json);
}
