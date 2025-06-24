import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';

part 'browse_hotels_state.dart';
part 'browse_hotels_cubit.freezed.dart';

class BrowseHotelsCubit extends Cubit<BrowseHotelsState> {
  BrowseHotelsCubit({required UserHotelRepo userHotelRepo})
    : _userHotelRepo = userHotelRepo,
      super(BrowseHotelsState.initial());

  Future<void> fetchAllHotels() async {
    emit(state.copyWith(status: Data.loading));
    try {
      final response = await _userHotelRepo.getAllHotels();

      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          statusMessage: r.message,
          hotels: r.data ?? state.hotels,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  final UserHotelRepo _userHotelRepo;
}
