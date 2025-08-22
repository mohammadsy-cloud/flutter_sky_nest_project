part of 'reservation_card_cubit.dart';

@freezed
sealed class ReservationCardState with _$ReservationCardState {
  const factory ReservationCardState({
    required Data status,
    required String message,
    required Reservation reservation,
  }) = _ReservationCardState;
  factory ReservationCardState.initial({required Reservation reservation}) {
    return ReservationCardState(
      status: Data.empty,
      message: 'No data',
      reservation: reservation,
    );
  }
}
