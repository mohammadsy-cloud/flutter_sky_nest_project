part of 'hotel_info_cubit.dart';

@freezed
sealed class HotelInfoState with _$HotelInfoState {
  const factory HotelInfoState({
    required Hotel hotel,
    required Data status,
    required String statusMessage,
    required List<String> nearbyPlacesPhotos,
    required Data nearbyPlacesPhotosStatus,
  }) = _HotelInfoState;
  factory HotelInfoState.initial(Hotel hotel) {
    return HotelInfoState(
      hotel: hotel,
      status: Data.empty,
      statusMessage: 'No data',
      nearbyPlacesPhotos: [],
      nearbyPlacesPhotosStatus: Data.empty,
    );
  }
}
