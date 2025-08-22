import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_rooms/user_rooms_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';
import '../../model/room.dart';

part 'hotel_rooms_state.dart';
part 'hotel_rooms_cubit.freezed.dart';

class HotelRoomsCubit extends Cubit<HotelRoomsState> {
  HotelRoomsCubit({required UserRoomsRepo userRoomsRepo, required Hotel hotel})
    : _userRoomsRepo = userRoomsRepo,
      super(HotelRoomsState.initial(hotel));

  void setTimeRange(DateTimeRange? timeRange) {
    emit(state.copyWith(timeRange: timeRange));
    fetchAlRooms();
  }

  Future<void> fetchAlRooms() async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _userRoomsRepo.fetchAllRooms(
        state.hotel.id ?? 0,
        state.timeRange,
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

  final UserRoomsRepo _userRoomsRepo;
}
