import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../repo/user_flights/requests/search_flights_by_date_and_location_request.dart';

part 'all_flights_state.dart';
part 'all_flights_cubit.freezed.dart';

class AllFlightsCubit extends Cubit<AllFlightsState> {
  AllFlightsCubit({required UserFlightsRepo userFlightsRepo})
    : _userFlightsRepo = userFlightsRepo,
      super(AllFlightsState.initial());
  void changefilter({String? start, String? end, DateTime? date}) {
    emit(
      state.copyWith(
        start: start ?? state.start,
        end: end ?? state.end,
        date: date ?? state.date,
      ),
    );
    fetchFlights();
  }

  Future<void> fetchFlights() async {
    try {
      emit(state.copyWith(status: Data.loading, message: 'Loading'));
      final response = await _userFlightsRepo.searchFlightsByDateAndLocation(
        SearchFlightsByDateAndLocationRequest(
          startPoint: state.start,
          destination: state.end,
          userDate: state.date,
        ),
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
