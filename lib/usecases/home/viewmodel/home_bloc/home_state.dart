part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required List<Hotel> hotelsList,
    required Data hotelsListStatus,
    required int notificationCount,
    required Data dataStatus,
    required String statusMessage,
  }) = _HomeState;
  factory HomeState.initial() {
    return HomeState(
      notificationCount: 0,
      hotelsList: [],
      hotelsListStatus: Data.empty,
      dataStatus: Data.empty,
      statusMessage: 'No data',
    );
  }
}
