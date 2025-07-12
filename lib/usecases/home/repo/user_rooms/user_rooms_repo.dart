import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:sky_nest/usecases/home/repo/user_rooms/user_rooms_endpoints.dart';

import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import '../../model/room.dart';

class UserRoomsRepo {
  Future<Either<CustomFailure, CustomResponse<List<Room>>>> fetchAllRooms(
    int hotelId,
  ) async {
    try {
      final response = await _dio.get(
        '${UserRoomsEndpoints.viewRooms}/$hotelId',
      );
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
