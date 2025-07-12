import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/common/models/custom_failure.dart';
import 'package:sky_nest/common/models/custom_response.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_endpoints.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/hotel.dart';
import '../../model/place.dart';

part 'hotel_places_state.dart';
part 'hotel_places_cubit.freezed.dart';

class HotelPlacesCubit extends Cubit<HotelPlacesState> {
  HotelPlacesCubit({required Hotel hotel})
    : _hotel = hotel,
      super(HotelPlacesState.initial());

  Future<void> fetchAllPlaces() async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _fetchHotelPlaces();
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.data,
          statusMessage: r.message,
          hotelPlaces: r.data ?? state.hotelPlaces,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Place>>>>
  _fetchHotelPlaces() async {
    try {
      final response = await ApiService().instance.get(
        '${UserHotelEndpoints.showHotelPlaces}/${_hotel.id}',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Fetched',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((place) {
                  return Place.fromJson(place);
                }).toList(),
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

  final Hotel _hotel;
}
