part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Data status,
    required String statusMessage,
    User? user,
    required double totalBalance,
  }) = _ProfileState;
  factory ProfileState.initial() {
    return ProfileState(
      status: Data.empty,
      statusMessage: 'No user yet',
      totalBalance: 0.0,
    );
  }
}
