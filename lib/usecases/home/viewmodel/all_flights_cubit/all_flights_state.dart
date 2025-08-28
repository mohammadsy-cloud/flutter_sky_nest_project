part of 'all_flights_cubit.dart';

@freezed
sealed class AllFlightsState with _$AllFlightsState {
  const factory AllFlightsState({
    required Data status,
    required String message,
    required List<Flight> flights,
    required String start,
    required String end,
    required DateTime date,
  }) = _AllFlightsState;
  factory AllFlightsState.initial() {
    return AllFlightsState(
      date: DateTime.now(),
      start: '',
      end: '',
      flights: [],
      message: 'no data',
      status: Data.empty,
    );
  }
}
