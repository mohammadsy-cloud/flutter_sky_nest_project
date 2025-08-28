part of 'room_info_cubit.dart';

@freezed
sealed class RoomInfoState with _$RoomInfoState {
  const factory RoomInfoState({
    required Data status,
    required String message,
    required Room room,
  }) = _RoomInfoState;
  factory RoomInfoState.initial({required Room room}) {
    return RoomInfoState(status: Data.empty, message: 'No data', room: room);
  }
}
