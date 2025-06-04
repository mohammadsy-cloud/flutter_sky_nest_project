part of 'authentication_bloc.dart';

@freezed
sealed class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signUp({required RegisterRequest request}) =
      AuthSignUp;
  const factory AuthenticationEvent.login({required LoginRequest request}) =
      AuthLogIn;
  const factory AuthenticationEvent.logout() = AuthLogOut;
  const factory AuthenticationEvent.changePasswordEmail({
    required ChangePasswordEmailRequest request,
  }) = ChangePasswordEmail;
  const factory AuthenticationEvent.changePasswordVerify({
    required VerifyOtpRequest request,
  }) = ChangePasswordVerify;
  const factory AuthenticationEvent.changePassword({
    required ChangePasswordRequest request,
  }) = ChangePassword;
  const factory AuthenticationEvent.addLocation({
    required double lat,
    required double long,
  }) = AuthAddLocation;
  const factory AuthenticationEvent.verifyOTP({required String otp}) =
      VerifyOTP;
}
