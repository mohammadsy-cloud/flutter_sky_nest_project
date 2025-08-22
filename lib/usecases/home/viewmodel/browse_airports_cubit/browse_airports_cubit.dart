import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/repo/user_airport/user_airport_repo.dart';

import '../../../../common/utilities/enumirations.dart';

part 'browse_airports_state.dart';
part 'browse_airports_cubit.freezed.dart';

class BrowseAirportsCubit extends Cubit<BrowseAirportsState> {
  BrowseAirportsCubit({required UserAirportRepo userAirportRepo})
    : _userAirportRepo = userAirportRepo,
      super(BrowseAirportsState.initial());

  void searchAirports(String query) {
    emit(state.copyWith(query: query, status: Data.data));
    fetchAirports();
  }

  void changeFilter(Filter f) {
    emit(state.copyWith(filter: f, status: Data.data));
    fetchAirports();
  }

  Future<void> fetchAirports() async {
    emit(state.copyWith(status: Data.loading));
    try {
      if (state.filter.isRating) {
        emit(state.copyWith(query: ''));
      }
      final response =
          state.filter.isRating
              ? await _userAirportRepo.filterAirportsByRating()
              : state.query.trim().isEmpty
              ? await _userAirportRepo.viewAllAirports()
              : await _userAirportRepo.searchAirportsByName(state.query);
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          airports: (r.data ?? state.airports) as List<Airport>,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  final UserAirportRepo _userAirportRepo;
}
