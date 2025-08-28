import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/repo/user_rooms/user_rooms_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/room.dart';
import '../../repo/user_hotel/requests/booking_rooms_request.dart';

part 'room_info_state.dart';
part 'room_info_cubit.freezed.dart';

class RoomInfoCubit extends Cubit<RoomInfoState> {
  RoomInfoCubit({required Room room})
    : super(RoomInfoState.initial(room: room));

  Future<void> fetchRoomDetails() async {
    emit(state.copyWith(status: Data.loading));
    try {
      final response = await UserRoomsRepo().viewRoomDetails(
        state.room.id ?? -1,
      );
      final newState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          room:
              r.data == null
                  ? state.room
                  : r.data!.copyWith(hotelId: state.room.hotelId),
          status: Data.data,
          message: r.message,
        ),
      };
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }

  Future<void> bookRoom({
    required DateTimeRange range,
    required int numOfPeople,
    required int paymentRatio,
  }) async {
    emit(state.copyWith(status: Data.loading));
    try {
      final response = await UserHotelRepo().bookRooms(
        BookingRoomsRequest(
          hotelId: state.room.hotelId ?? -1,
          setOfRooms: {state.room.id ?? -1},
          numberOfRoom: 1,
          launchDate: range.start,
          departureDate: range.end,
          numberOfPerson: numOfPeople,
          paymentRatio: paymentRatio,
        ),
      );
      final newState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          message: r.message,
        ),
      };
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }
}
