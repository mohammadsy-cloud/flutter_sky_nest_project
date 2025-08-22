import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_reservation_request.freezed.dart';
part 'flight_reservation_request.g.dart';

@freezed
sealed class FlightReservationRequest with _$FlightReservationRequest {
  factory FlightReservationRequest({
    required int flightId,
    required int numberOfPerson,
  }) = _FlightReservationRequest;

  factory FlightReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$FlightReservationRequestFromJson(json);
}
