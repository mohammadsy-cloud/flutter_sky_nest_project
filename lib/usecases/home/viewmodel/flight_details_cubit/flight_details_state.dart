part of 'flight_details_cubit.dart';

@freezed
sealed class FlightDetailsState with _$FlightDetailsState {
  const factory FlightDetailsState({
    required Data status,
    required String message,
    required Flight flight,
  }) = _FlightDetailsState;
  factory FlightDetailsState.initial({required Flight flight}) {
    return FlightDetailsState(
      flight: flight,
      status: Data.empty,
      message: 'No data yet',
    );
  }
}
