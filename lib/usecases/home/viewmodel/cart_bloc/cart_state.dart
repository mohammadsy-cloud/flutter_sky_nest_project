part of 'cart_bloc.dart';

@freezed
sealed class CartState with _$CartState {
  const factory CartState({
    required Data status,
    required String statusMessage,
    required Map<Hotel, List<Room>> hotelRooms,
    MapEntry<Hotel, List<Room>>? currentHotel,
  }) = _CartState;
  factory CartState.initial() {
    return CartState(
      statusMessage: 'No data',
      status: Data.empty,
      hotelRooms: {},
    );
  }
}
