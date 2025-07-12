part of 'hotel_reservations_bloc.dart';

@freezed
sealed class HotelReservationsState with _$HotelReservationsState {
  const factory HotelReservationsState({
    required Data status,
    required String statusMessage,
    required BookingStatus bookingStatus,
    required List<Reservation> reservations,
  }) = _HotelReservationsState;
  factory HotelReservationsState.initial() {
    return HotelReservationsState(
      status: Data.empty,
      statusMessage: 'No data',
      bookingStatus: BookingStatus.activated,
      reservations: [],
    );
  }
}
