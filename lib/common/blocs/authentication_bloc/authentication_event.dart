part of 'authentication_bloc.dart';

@freezed
sealed class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signUp({required RegisterRequest request}) =
      AuthSignUp;
  const factory AuthenticationEvent.login({required LoginRequest request}) =
      AuthLogIn;
  const factory AuthenticationEvent.addLocation({
    required double lat,
    required double long,
  }) = AuthAddLocation;
  const factory AuthenticationEvent.verifyOTP({required String otp}) =
      VerifyOTP;
}
