part of 'browse_airports_cubit.dart';

@freezed
sealed class BrowseAirportsState with _$BrowseAirportsState {
  const factory BrowseAirportsState({
    required Data status,
    required String message,
    required List<Airport> airports,
    @Default('') String query,
    @Default(Filter.all) Filter filter,
  }) = _BrowseAirportsState;
  factory BrowseAirportsState.initial() {
    return BrowseAirportsState(
      status: Data.empty,
      message: 'No data',
      airports: [],
    );
  }
}
