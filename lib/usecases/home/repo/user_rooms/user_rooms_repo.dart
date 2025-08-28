import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/utilities/date_only_converter.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_endpoints.dart';
import 'package:sky_nest/usecases/home/repo/user_rooms/user_rooms_endpoints.dart';

import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import '../../model/room.dart';

class UserRoomsRepo {
  Future<Either<CustomFailure, CustomResponse<List<Room>>>> fetchAllRooms(
    int hotelId, [
    DateTimeRange? timeRange,
  ]) async {
    try {
      final response = await _dio.get(
        '${timeRange == null ? UserRoomsEndpoints.viewRooms : UserHotelEndpoints.filterAvailableRoomsInHotel}/$hotelId',
        queryParameters:
            timeRange == null
                ? null
                : {
                  'startDate': DateOnlyConverter().toJson(timeRange.start),
                  'endDate': DateOnlyConverter().toJson(timeRange.end),
                },
      );
      if ((response.statusCode ?? 500) == 204) {
        return Right(
          CustomResponse<List<Room>>(
            message: 'Rooms fetched successfully!',
            statusCode: response.statusCode ?? 500,
            data: [],
          ),
        );
      }
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Room>>(
            message: 'Rooms fetched successfully!',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((room) {
                  return Room.fromJson(room);
                }).toList(),
          ),
        );
      } else {
        throw Exception('Rooms are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<Room>>> viewRoomDetails(
    int roomId,
  ) async {
    try {
      final response = await _dio.get(
        '${UserRoomsEndpoints.viewRoomDetails}/$roomId',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<Room>(
            message: 'Room fetched successfully!',
            statusCode: response.statusCode ?? 500,
            data: Room.fromJson(response.data),
          ),
        );
      } else {
        throw Exception('Room is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  final Dio _dio = ApiService().instance;
}
