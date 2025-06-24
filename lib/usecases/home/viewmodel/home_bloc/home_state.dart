part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required List<Hotel> hotelsList,
    required Data hotelsListStatus,
    required Data dataStatus,
    required String statusMessage,
  }) = _HomeState;
  factory HomeState.initial() {
    return HomeState(
      hotelsList: [],
      hotelsListStatus: Data.empty,
      dataStatus: Data.empty,
      statusMessage: 'No data',
    );
  }
}
