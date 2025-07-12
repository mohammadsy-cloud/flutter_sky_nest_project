import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';

part 'hotel_info_state.dart';
part 'hotel_info_cubit.freezed.dart';

class HotelInfoCubit extends Cubit<HotelInfoState> {
  HotelInfoCubit({required UserHotelRepo userHotelRepo, required Hotel hotel})
    : _userHotelRepo = userHotelRepo,
      super(HotelInfoState.initial(hotel));

  Future<void> rateHotel(double ratingCount, String comment) async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _userHotelRepo.rateHotel(
        state.hotel.id ?? 0,
        ratingCount.toInt(),
        comment,
      );
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

  Future<void> showHotelDetails() async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _userHotelRepo.showHotelById(state.hotel.id ?? 0);
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          statusMessage: r.message,
          hotel: r.data ?? state.hotel,
        ),
      };
      emit(futureState);
      if (!state.status.isError) {
        showHotelPlacesImages();
      }
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  Future<void> showHotelPlacesImages() async {
    emit(state.copyWith(nearbyPlacesPhotosStatus: Data.loading));
    try {
      final response = await _userHotelRepo.showHotelPlaces(
        state.hotel.id ?? 0,
      );
      final futureState = switch (response) {
        Left() => state.copyWith(nearbyPlacesPhotosStatus: Data.error),
        Right(value: final r) => state.copyWith(
          nearbyPlacesPhotosStatus: Data.done,
          nearbyPlacesPhotos:
              (r.data ?? []).map((place) {
                return place.imagePlaceList?.first.imageUrl ?? '';
              }).toList(),
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  final UserHotelRepo _userHotelRepo;
}
