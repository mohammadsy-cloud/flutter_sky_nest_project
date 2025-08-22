part of 'flight_reservations_bloc.dart';

@freezed
sealed class FlightReservationsState with _$FlightReservationsState {
  const factory FlightReservationsState({
    required Data status,
    required String message,
    required List<Flight> flights,
    required BookingStatus bookingStatus,
  }) = _FlightReservationsState;
  factory FlightReservationsState.initial() {
    return FlightReservationsState(
      bookingStatus: BookingStatus.activated,
      flights: [],
      status: Data.empty,
      message: 'no data',
    );
  }
}
