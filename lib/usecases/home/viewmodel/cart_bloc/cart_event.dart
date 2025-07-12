part of 'cart_bloc.dart';

@freezed
sealed class CartEvent with _$CartEvent {
  const factory CartEvent.addedToCart({
    required Hotel hotel,
    required Room room,
  }) = AddedToCart;
  const factory CartEvent.removedFromCart({required Hotel hotel, Room? room}) =
      RemovedFromCart;
  const factory CartEvent.currentHotelSet({required Hotel hotel}) =
      CurrentHotelSet;
  const factory CartEvent.reservationCompleted({
    required BookingRoomsRequest request,
  }) = ReservationCompleted;
}
