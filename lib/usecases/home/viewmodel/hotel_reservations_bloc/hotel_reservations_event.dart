part of 'hotel_reservations_bloc.dart';

@freezed
class HotelReservationsEvent with _$HotelReservationsEvent {
  const factory HotelReservationsEvent.reservationsFetched() =
      ReservationsFetched;
  const factory HotelReservationsEvent.statusChanged({
    required BookingStatus status,
  }) = StatusChanged;
}
