import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../repo/user_hotel/user_hotel_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required UserHotelRepo userHotelRepo})
    : _userHotelRepo = userHotelRepo,
      super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      if (event is NearbyHotelsFetched) {
        await _fetchAllHotels(emit);
      }

      if (event is NearbyFlightsFetched) {
        await _fetchAllFlights(emit);
      }
    });
  }

  Future<void> _fetchAllHotels(Emitter emit) async {
    emit(state.copyWith(hotelsListStatus: Data.loading));
    try {
      final response = await _userHotelRepo.showNearbyHotels();
      final futureState = switch (response) {
        Left() => state.copyWith(hotelsListStatus: Data.error),
        Right(value: final r) => state.copyWith(
          hotelsList: r.data ?? state.hotelsList,
          hotelsListStatus: Data.data,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(hotelsListStatus: Data.error));
    }
  }

  Future<void> _fetchAllFlights(Emitter emit) async {}

  final UserHotelRepo _userHotelRepo;
}
