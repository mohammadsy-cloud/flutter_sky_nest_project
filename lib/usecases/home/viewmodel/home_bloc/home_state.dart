part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required List<Hotel> hotelsList,
    required List<Airport> airportsList,
    required Data hotelsListStatus,
    required Data airportsListStatus,
    required int notificationCount,
    required Data dataStatus,
    required String statusMessage,
  }) = _HomeState;
  factory HomeState.initial() {
    return HomeState(
      notificationCount: 0,
      hotelsList: [],
      airportsList: [],
      hotelsListStatus: Data.empty,
      airportsListStatus: Data.empty,
      dataStatus: Data.empty,
      statusMessage: 'No data',
    );
  }
}
