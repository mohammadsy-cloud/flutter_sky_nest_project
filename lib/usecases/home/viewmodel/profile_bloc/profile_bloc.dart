import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/models/user.dart';
import '../../repo/profile/profile_repo.dart';
import '../../../../common/utilities/enumirations.dart';
import '../../repo/profile/requests/edit_profile_request.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required ProfileRepo profileRepo})
    : _profileRepo = profileRepo,
      super(ProfileState.initial()) {
    on<ProfileEvent>((event, emit) {
      emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    });
    on<ProfileFetched>(_fetchProfile);
    on<ProfileModified>(_modifyProfile);
    on<TotalBalanceFetched>(_fetchTotalBalance);
  }

  Future<void> _fetchProfile(
    ProfileFetched event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final response = await _profileRepo.getMyProfile();
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          statusMessage: r.message,
          user: r.data,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  Future<void> _modifyProfile(
    ProfileModified event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final response = await _profileRepo.editProfile(event.request);
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          statusMessage: r.message,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  Future<void> _fetchTotalBalance(
    TotalBalanceFetched event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final response = await _profileRepo.viewTotalBalance();

      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          statusMessage: r.message,
          totalBalance: r.data ?? state.totalBalance,
        ),
      };

      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  final ProfileRepo _profileRepo;
}
