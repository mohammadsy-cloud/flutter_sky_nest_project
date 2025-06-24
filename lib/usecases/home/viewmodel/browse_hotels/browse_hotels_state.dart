part of 'browse_hotels_cubit.dart';

@freezed
sealed class BrowseHotelsState with _$BrowseHotelsState {
  const factory BrowseHotelsState({
    required Data status,
    required String statusMessage,
    required List<Hotel> hotels,
  }) = _BrowseHotelsState;
  factory BrowseHotelsState.initial() {
    return BrowseHotelsState(
      status: Data.empty,
      statusMessage: 'No data',
      hotels: [],
    );
  }
}
