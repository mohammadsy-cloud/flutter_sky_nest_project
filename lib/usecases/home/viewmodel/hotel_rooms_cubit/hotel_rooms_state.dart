part of 'hotel_rooms_cubit.dart';

@freezed
sealed class HotelRoomsState with _$HotelRoomsState {
  const factory HotelRoomsState({
    required Data status,
    required String statusMessage,
    required List<Room> rooms,
    required Hotel hotel,
  }) = _HotelRoomsState;
  factory HotelRoomsState.initial(Hotel hotel) {
    return HotelRoomsState(
      status: Data.empty,
      statusMessage: 'No data',
      rooms: [],
      hotel: hotel,
    );
  }
}
