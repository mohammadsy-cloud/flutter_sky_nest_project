import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_endpoints.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/reservation.dart';

part 'hotel_reservations_event.dart';
part 'hotel_reservations_state.dart';
part 'hotel_reservations_bloc.freezed.dart';

class HotelReservationsBloc
    extends Bloc<HotelReservationsEvent, HotelReservationsState> {
  HotelReservationsBloc({required UserHotelRepo userHotelRepo})
    : _userHotelRepo = userHotelRepo,
      super(HotelReservationsState.initial()) {
    on<HotelReservationsEvent>((event, emit) {
      if (event is! StatusChanged) {
        emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
      }
    });
    on<ReservationsFetched>((_, emit) async {
      await _fetchReservations(emit);
    });
    on<StatusChanged>((event, emit) async {
      emit(state.copyWith(bookingStatus: event.status, status: Data.loading));
      await _fetchReservations(emit);
    });
  }

  Future<void> _fetchReservations(Emitter<HotelReservationsState> emit) async {
    try {
      final response = await _userHotelRepo.showReservations(
        state.bookingStatus,
      );
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          statusMessage: r.message,
          reservations: r.data ?? state.reservations,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  String _selectPath(BookingStatus status) {
    return switch (status) {
      BookingStatus.activated => UserHotelEndpoints.showActiveReservation,
      BookingStatus.canceled => UserHotelEndpoints.showCanceledReservation,
      BookingStatus.unacceptable => UserHotelEndpoints.showIncorrectReservation,
    };
  }

  final UserHotelRepo _userHotelRepo;
}
