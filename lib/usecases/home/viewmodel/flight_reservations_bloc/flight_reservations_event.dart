part of 'flight_reservations_bloc.dart';

@freezed
sealed class FlightReservationsEvent with _$FlightReservationsEvent {
  const factory FlightReservationsEvent.fetchFlightBookings() =
      FlightBookingsFetched;
  const factory FlightReservationsEvent.changeFilter(BookingStatus status) =
      FilterChanged;
  const factory FlightReservationsEvent.cancelFlightBooking(int flightId) =
      FlightBookingCancelled;
}
