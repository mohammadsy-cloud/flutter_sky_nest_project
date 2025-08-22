import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/reservation.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';

part 'reservation_card_state.dart';
part 'reservation_card_cubit.freezed.dart';

class ReservationCardCubit extends Cubit<ReservationCardState> {
  ReservationCardCubit({required Reservation reservation})
    : super(ReservationCardState.initial(reservation: reservation));

  Future<void> cancelReservation() async {
    emit(state.copyWith(status: Data.loading, message: 'Loading'));
    try {
      final response = await UserHotelRepo().cancelBooking(
        state.reservation.bookingId ?? -1,
      );
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          message: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          message: r.message,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, message: e.toString()));
    }
  }
}
