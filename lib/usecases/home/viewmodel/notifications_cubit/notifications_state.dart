part of 'notifications_cubit.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    required Data status,
    required String statusMessage,
    required List<NotificationModel> notifications,
  }) = _NotificationsState;
  factory NotificationsState.initial() {
    return NotificationsState(
      notifications: [],
      status: Data.empty,
      statusMessage: 'No data',
    );
  }
}
