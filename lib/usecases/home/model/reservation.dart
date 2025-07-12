import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/common/utilities/enumirations.dart';

import '../../../common/utilities/booking_status_converter.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
sealed class Reservation with _$Reservation {
  factory Reservation({
    int? bookingId,
    DateTime? bookingStartDate,
    DateTime? bookingEndDate,
    String? bookingType,
    String? hotelName,
    int? numberOfNights,
    String? address,
    double? totalCost,
    @BookingStatusConverter() BookingStatus? statusBooking,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}
