import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_rooms_request.freezed.dart';
part 'booking_rooms_request.g.dart';

@freezed
sealed class BookingRoomsRequest with _$BookingRoomsRequest {
  factory BookingRoomsRequest({
    required int numberOfPerson,
    required int numberOfRoom,
    required String roomType,
    required DateTime launchDate,
    required DateTime departureDate,
    required int paymentRatio,
  }) = _BookingRoomsRequest;

  factory BookingRoomsRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRoomsRequestFromJson(json);
}
