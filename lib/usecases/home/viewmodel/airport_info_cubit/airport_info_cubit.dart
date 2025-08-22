import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_endpoints.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../repo/user_flights/requests/search_by_sd_all_request.dart';

part 'airport_info_state.dart';
part 'airport_info_cubit.freezed.dart';

class AirportInfoCubit extends Cubit<AirportInfoState> {
  AirportInfoCubit({
    required UserFlightsRepo userFlightsRepo,
    required Airport airport,
  }) : _userFlightsRepo = userFlightsRepo,
       super(AirportInfoState.initial(airport: airport));
  void changeQuery({String? startPoint, String? endPoint}) {
    if (startPoint == null && endPoint == null) {
      return;
    }
    if (startPoint != null) {
      emit(state.copyWith(startPoint: startPoint));
    } else if (endPoint != null) {
      emit(state.copyWith(endPoint: endPoint));
    }
    fetchFlights();
  }

  Future<void> fetchFlights() async {
    emit(state.copyWith(status: Data.loading));
    try {
      final response = await _userFlightsRepo.searchFlightsBySAndDInOne(
        SearchBySdAllRequest(
          startPoint: state.startPoint,
          destination: state.endPoint,
        ),
        state.airport.id ?? -1,
      );
      final futureState = switch (response) {
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
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  final UserFlightsRepo _userFlightsRepo;
}
