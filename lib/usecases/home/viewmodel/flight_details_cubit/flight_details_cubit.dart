import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/common/models/custom_failure.dart';
import 'package:sky_nest/common/models/custom_response.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/flight.dart';
import '../../repo/user_airport/requests/flight_reservation_request.dart';
import '../../repo/user_airport/user_airport_repo.dart';

part 'flight_details_state.dart';
part 'flight_details_cubit.freezed.dart';

class FlightDetailsCubit extends Cubit<FlightDetailsState> {
  FlightDetailsCubit({
    required UserFlightsRepo userFlightsRepo,
    required Flight flight,
  }) : _userFlightsRepo = userFlightsRepo,
       super(FlightDetailsState.initial(flight: flight));

  Future<void> fetchFlightDetails() async {
    try {
      emit(state.copyWith(status: Data.loading));
      final response = await _userFlightsRepo.viewFlightDetails(
        state.flight.id ?? -1,
      );
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          flight: r.data ?? state.flight,
          message: r.message,
          status: Data.data,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  Future<void> flightReservation(int numPreson) async {
    emit(state.copyWith(status: Data.loading));

    try {
      final response = await UserAirportRepo().flightReservation(
        FlightReservationRequest(
          flightId: state.flight.id ?? -1,
          numberOfPerson: numPreson,
        ),
      );
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          message: r.message,
          status: Data.done,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  final UserFlightsRepo _userFlightsRepo;
}
