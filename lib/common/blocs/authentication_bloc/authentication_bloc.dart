import 'dart:async';
import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_nest/common/models/user.dart';
import 'package:sky_nest/common/repos/authentication/authentication_repo.dart';
import 'package:sky_nest/common/repos/authentication/requests/change_password_email_request.dart';
import 'package:sky_nest/common/repos/authentication/requests/change_password_request.dart';
import 'package:sky_nest/common/repos/authentication/requests/register_request.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repos/authentication/requests/login_request.dart';
import '../../repos/authentication/requests/verify_otp_request.dart';
import '../../utilities/enumirations.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationRepo authenticationRepo})
    : _authenticationRepo = authenticationRepo,
      super(AuthenticationState.initial()) {
    on<AuthenticationEvent>((event, emit) {
      if (event is! AuthAddLocation) {
        emit(state.copyWith(dataState: Data.loading, message: 'Loading'));
      }
    });
    on<AuthSignUp>(_signUpUser);
    on<AuthLogIn>(_logInUser);
    on<ChangePasswordEmail>(_changePasswordEmail);
    on<ChangePasswordVerify>(_changePasswordVerify);
    on<ChangePassword>(_changePassword);
    on<AuthLogOut>(_logUserOut);
    on<AuthAddLocation>(
      (event, emit) => emit(
        state.copyWith(
          user: state.user?.copyWith(
            latitude: event.lat,
            longitude: event.long,
          ),
        ),
      ),
    );
    on<VerifyOTP>(_verifyOTP);
  }

  Future<void> _signUpUser(
    AuthSignUp event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.signUp(event.request);

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          user: state.user?.copyWith(
            email: event.request.email,
            fullName: event.request.fullName,
          ),
          dataState: Data.data,
          message: r.message,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _logInUser(
    AuthLogIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.logIn(event.request);

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          token: r.data,
          user: state.user?.copyWith(email: event.request.email, token: r.data),
          dataState: Data.data,
          message: r.message,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _verifyOTP(
    VerifyOTP event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.verifyOTP(
        request: VerifyOtpRequest(
          email: state.user?.email ?? '',
          code: event.otp,
        ),
      );

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          user: state.user?.copyWith(token: r.data),
          dataState: Data.done,
          message: r.message,
          token: r.data,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _changePasswordEmail(
    ChangePasswordEmail event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.changePasswordEmail(
        event.request,
      );

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          user: state.user?.copyWith(email: event.request.email),
          dataState: Data.done,
          message: r.message,
          token: r.data,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _changePasswordVerify(
    ChangePasswordVerify event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.changePasswordVerify(
        event.request,
      );

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          user: state.user?.copyWith(email: event.request.email),
          dataState: Data.done,
          message: r.message,
          token: r.data,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _changePassword(
    ChangePassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.changePassword(event.request);

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          dataState: Data.done,
          message: r.message,
          token: r.data,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  Future<void> _logUserOut(
    AuthLogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final response = await _authenticationRepo.logout();

      final nextState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataState: Data.error,
          message: l.message,
        ),
        Right(value: final r) => AuthenticationState.initial().copyWith(
          message: r.message,
          dataState: Data.done,
        ),
      };
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(dataState: Data.error, message: e.toString()));
    }
  }

  final AuthenticationRepo _authenticationRepo;

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthenticationState(
        dataState: Data.values.firstWhere(
          (status) => status.name == json['dataState'],
        ),
        message: json['message'],
        token: json['token'],
        user: User.fromJson(json['user']),
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    try {
      return {
        'user': state.user?.toJson(),
        'token': state.token,
        'dataState': state.dataState.name,
        'message': state.message,
      };
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
