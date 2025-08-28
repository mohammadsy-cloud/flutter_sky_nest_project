part of 'browse_hotels_cubit.dart';

@freezed
sealed class BrowseHotelsState with _$BrowseHotelsState {
  const factory BrowseHotelsState({
    required Data status,
    required String statusMessage,
    required List<Hotel> hotels,
    required Filter currentFilter,
    required bool isNearby,
  }) = _BrowseHotelsState;
  factory BrowseHotelsState.initial({bool isNearby = false}) {
    return BrowseHotelsState(
      isNearby: isNearby,
      status: Data.empty,
      statusMessage: 'No data',
      hotels: [],
      currentFilter: Filter.all,
    );
  }
}
