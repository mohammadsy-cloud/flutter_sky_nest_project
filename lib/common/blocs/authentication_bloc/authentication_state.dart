part of 'authentication_bloc.dart';

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    User? user,
    String? token,
    required Data dataState,
    required String message,
  }) = _AuthenticationBlocState;

  factory AuthenticationState.initial() {
    return AuthenticationState(
      dataState: Data.empty,
      message: 'no data',
      user: User(),
    );
  }
}
