part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.profileFetched() = ProfileFetched;
  const factory ProfileEvent.totalBalanceFetched() = TotalBalanceFetched;
  const factory ProfileEvent.profileModified({
    required EditProfileRequest request,
  }) = ProfileModified;
}
