import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/room.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';
import '../../repo/user_hotel/requests/show_all_rooms_request.dart';

part 'all_rooms_state.dart';
part 'all_rooms_cubit.freezed.dart';

class AllRoomsCubit extends Cubit<AllRoomsState> {
  AllRoomsCubit({required UserHotelRepo userHotelRepo})
    : _userHotelRepo = userHotelRepo,
      super(AllRoomsState.initial());

  void searchByAddress({required String query}) {
    emit(state.copyWith(query: query));
    fetchAllRooms();
  }

  void changeTimeRange({required DateTimeRange timeRange}) {
    emit(state.copyWith(timeRange: timeRange));
    fetchAllRooms();
  }

  Future<void> fetchAllRooms() async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _userHotelRepo.filterAvailableRoomsInAllHotel(
        ShowAllRoomsRequest(
          address: state.query,
          startDate: state.timeRange.start,
          endDate: state.timeRange.end,
        ),
      );
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          statusMessage: r.message,
          rooms: r.data ?? state.rooms,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  final UserHotelRepo _userHotelRepo;
}
