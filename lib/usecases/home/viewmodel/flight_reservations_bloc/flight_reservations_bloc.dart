import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_airport/user_airport_repo.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/flight.dart';

part 'flight_reservations_event.dart';
part 'flight_reservations_state.dart';
part 'flight_reservations_bloc.freezed.dart';

class FlightReservationsBloc
    extends Bloc<FlightReservationsEvent, FlightReservationsState> {
  FlightReservationsBloc({required UserFlightsRepo userFlightsRepo})
    : _userFlightsRepo = userFlightsRepo,
      super(FlightReservationsState.initial()) {
    on<FlightReservationsEvent>((event, emit) {
      if (event is! FilterChanged) {
        emit(state.copyWith(status: Data.loading));
      }
    });
    on<FilterChanged>((event, emit) {
      emit(state.copyWith(bookingStatus: event.status));
      add(FlightBookingsFetched());
    });
    on<FlightBookingsFetched>(_fetchFlightBookings);
    on<FlightBookingCancelled>(_cancelFlightBooking);
  }

  Future<void> _fetchFlightBookings(
    FlightBookingsFetched event,
    Emitter<FlightReservationsState> emit,
  ) async {
    try {
      final response = await _userFlightsRepo.showActiveFlights(
        state.bookingStatus,
      );
      final newState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          message: r.message,
          flights: r.data ?? state.flights,
        ),
      };
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  final UserFlightsRepo _userFlightsRepo;

  Future<void> _cancelFlightBooking(
    FlightBookingCancelled event,
    Emitter<FlightReservationsState> emit,
  ) async {
    try {
      final response = await UserAirportRepo().cancelFlightBooking(
        event.flightId,
      );
      final newState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(message: r.message),
      };
      emit(newState);
      if (!newState.status.isError) {
        add(FlightBookingsFetched());
      }
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }
}
