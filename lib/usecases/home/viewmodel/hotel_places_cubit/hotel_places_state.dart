part of 'hotel_places_cubit.dart';

@freezed
sealed class HotelPlacesState with _$HotelPlacesState {
  const factory HotelPlacesState({
    required List<Place> hotelPlaces,
    required Data status,
    required String statusMessage,
  }) = _HotelPlacesState;
  factory HotelPlacesState.initial() {
    return HotelPlacesState(
      hotelPlaces: [],
      status: Data.empty,
      statusMessage: 'No data',
    );
  }
}
