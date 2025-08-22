part of 'all_rooms_cubit.dart';

@freezed
sealed class AllRoomsState with _$AllRoomsState {
  const factory AllRoomsState({
    required Data status,
    required String statusMessage,
    required Map<Hotel, List<Room>> rooms,
    required DateTimeRange timeRange,
    required String query,
  }) = _AllRoomsState;
  factory AllRoomsState.initial() {
    return AllRoomsState(
      query: '',
      rooms: {},
      status: Data.empty,
      statusMessage: 'No data',
      timeRange: DateTimeRange(
        start: DateTime.now().add(Duration(days: 1)),
        end: DateTime.now().add(Duration(days: 2)),
      ),
    );
  }
}
