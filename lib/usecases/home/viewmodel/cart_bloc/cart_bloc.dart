import 'dart:async';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_nest/usecases/home/model/room.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';
import '../../repo/user_hotel/requests/booking_rooms_request.dart';
import '../../repo/user_hotel/user_hotel_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc({required UserHotelRepo userHotelRepo})
    : _hotelRepo = userHotelRepo,
      super(CartState.initial()) {
    on<CartEvent>((event, emit) {
      if (event is ReservationCompleted) {
        emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
      }
    });
    on<AddedToCart>(_addToCart);
    on<RemovedFromCart>(_removeFromCart);
    on<CurrentHotelSet>(_setCurrentHotel);
    on<ReservationCompleted>(_completeReservation);
  }

  bool checkExsistance(Hotel hotel, Room room) {
    return state.hotelRooms[hotel]?.contains(room) ?? false;
  }

  void _addToCart(AddedToCart event, Emitter<CartState> emit) {
    final hotelKey = state.hotelRooms.keys.firstWhere((h) {
      return event.hotel.id == h.id;
    }, orElse: () => event.hotel);
    final currentRooms = state.hotelRooms[hotelKey] ?? []; // Handle null case
    final updatedMap = {
      ...state.hotelRooms,
      hotelKey: [...currentRooms, event.room], // Overwrite entry
    };
    emit(state.copyWith(hotelRooms: updatedMap));
  }

  void _removeFromCart(RemovedFromCart event, Emitter<CartState> emit) {
    final hotelKey = state.hotelRooms.keys.firstWhere((h) {
      return event.hotel.id == h.id;
    }, orElse: () => event.hotel);
    final newMap = Map.of(state.hotelRooms);
    if (event.room == null) {
      newMap.remove(hotelKey);
    } else {
      final oldRooms = newMap[hotelKey] ?? [];
      final updatedRooms = List<Room>.from(oldRooms)..remove(
        oldRooms.firstWhere((r) {
          return event.room?.id == r.id;
        }),
      );
      if (updatedRooms.isEmpty) {
        newMap.remove(hotelKey);
      } else {
        newMap[hotelKey] = updatedRooms;
        add(CurrentHotelSet(hotel: hotelKey));
      }
    }
    emit(state.copyWith(hotelRooms: newMap));
  }

  void _setCurrentHotel(CurrentHotelSet event, Emitter<CartState> emit) async {
    if (state.hotelRooms[event.hotel] == null) {
      return;
    }
    final MapEntry<Hotel, List<Room>> currentEntry = MapEntry(
      event.hotel,
      state.hotelRooms[event.hotel]!,
    );
    emit(state.copyWith(currentHotel: currentEntry));
  }

  Future<void> _completeReservation(
    ReservationCompleted event,
    Emitter<CartState> emit,
  ) async {
    try {
      final response = await _hotelRepo.bookRooms(
        event.request.copyWith(
          hotelId: state.currentHotel?.key.id,
          setOfRooms:
              state.currentHotel?.value.map((room) {
                return room.id ?? 0;
              }).toSet(),
        ),
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
      if (futureState.status.isDone) {
        add(RemovedFromCart(hotel: state.currentHotel!.key));
      }
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      return CartState(
        status: DataX.fromJson(json['status']),
        statusMessage: json['statusMessage'],
        hotelRooms: Map.fromEntries(
          (json['hotelRooms'] as List).map(
            (e) => MapEntry(
              Hotel.fromJson(e['hotel']),
              (e['rooms'] as List).map((r) => Room.fromJson(r)).toList(),
            ),
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    try {
      return {
        'status': state.status.toJson(),
        'statusMessage': state.statusMessage,
        'hotelRooms':
            state.hotelRooms.entries
                .map(
                  (e) => {
                    'hotel': e.key.toJson(),
                    'rooms': e.value.map((room) => room.toJson()).toList(),
                  },
                )
                .toList(),
      };
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  final UserHotelRepo _hotelRepo;
}
