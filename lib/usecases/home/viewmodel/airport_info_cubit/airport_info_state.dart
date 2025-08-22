part of 'airport_info_cubit.dart';

@freezed
sealed class AirportInfoState with _$AirportInfoState {
  const factory AirportInfoState({
    required Data status,
    required String message,
    required Airport airport,
    required List<Flight> flights,
    required String startPoint,
    required String endPoint,
  }) = _AirportInfoState;
  factory AirportInfoState.initial({required Airport airport}) {
    return AirportInfoState(
      airport: airport,
      endPoint: '',
      startPoint: '',
      status: Data.empty,
      flights: [],
      message: 'No data',
    );
  }
}
