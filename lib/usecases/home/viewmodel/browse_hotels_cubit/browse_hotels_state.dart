part of 'browse_hotels_cubit.dart';

@freezed
sealed class BrowseHotelsState with _$BrowseHotelsState {
  const factory BrowseHotelsState({
    required Data status,
    required String statusMessage,
    required List<Hotel> hotels,
    required Filter currentFilter,
  }) = _BrowseHotelsState;
  factory BrowseHotelsState.initial() {
    return BrowseHotelsState(
      status: Data.empty,
      statusMessage: 'No data',
      hotels: [],
      currentFilter: Filter.all,
    );
  }
}
