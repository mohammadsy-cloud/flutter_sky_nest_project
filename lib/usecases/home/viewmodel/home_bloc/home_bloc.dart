import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';

import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import '../../../../common/services/api_service/api_service.dart';
import '../../../../common/utilities/enumirations.dart';
import '../../model/airport.dart';
import '../../model/notification_model.dart';
import '../../repo/profile/profile_endpoints.dart';
import '../../repo/user_airport/user_airport_endpoints.dart';
import '../../repo/user_hotel/user_hotel_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required UserHotelRepo userHotelRepo})
    : _userHotelRepo = userHotelRepo,
      super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {});
    on<NearbyHotelsFetched>(_fetchAllHotels);
    on<NearbyAirportsFetched>(_fetchAllAirports);
    on<NotificationsCountFetched>(_fetchNotificationsCount);
  }

  Future<void> _fetchAllHotels(NearbyHotelsFetched event, Emitter emit) async {
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

  Future<void> _fetchAllAirports(
    NearbyAirportsFetched event,
    Emitter emit,
  ) async {
    emit(state.copyWith(airportsListStatus: Data.loading));
    try {
      final response = await _viewNearUserAirports();
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          airportsListStatus: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          airportsList: r.data ?? state.airportsList,
          airportsListStatus: Data.data,
          statusMessage: r.message,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(
        state.copyWith(
          airportsListStatus: Data.error,
          statusMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _fetchNotificationsCount(
    NotificationsCountFetched event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final response = await _fetchAllNotifications();
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          dataStatus: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          dataStatus: Data.done,
          statusMessage: r.message,
          notificationCount: r.data?.length ?? 0,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(dataStatus: Data.error, statusMessage: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<NotificationModel>>>>
  _fetchAllNotifications() async {
    try {
      final response = await ApiService().instance.get(
        ProfileEndpoints.notifications,
      );

      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<NotificationModel>>(
            message: 'Notifications fetched successfully',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((not) {
                  return NotificationModel.fromJson(not);
                }).toList(),
          ),
        );
      } else if (response.statusCode == 400) {
        return Right(
          CustomResponse<List<NotificationModel>>(
            data: [],
            message: 'Notifications fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Airport>>>>
  _viewNearUserAirports() async {
    try {
      final response = await ApiService().instance.get(
        UserAirportEndpoints.viewNearUserAirport,
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Airport>>(
            message: 'Airports fetched successfully',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((airport) {
                  return Airport.fromJson(airport);
                }).toList(),
          ),
        );
      } else {
        throw Exception('Airports are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  final UserHotelRepo _userHotelRepo;
}
