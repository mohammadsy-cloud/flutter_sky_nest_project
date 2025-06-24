import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import '../../../../usecases/home/repo/user_hotel/user_hotel_endpoints.dart';
import '../../../../common/services/api_service/api_service.dart';
import '../../../../common/utilities/enumirations.dart';
import '../../../../usecases/home/model/hotel.dart';

import 'requests/booking_rooms_request.dart';

class UserHotelRepo {
  final Dio _dio;

  UserHotelRepo({Dio? dio}) : _dio = dio ?? ApiService().instance;

  Future<Either<CustomFailure, CustomResponse<List<Hotel>>>>
  getAllHotels() async {
    try {
      final response = await _dio.get(UserHotelEndpoints.showAllHotels);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Hotel>>(
            data:
                ((response.data['elements'] ?? []) as List<dynamic>).map((
                  hotel,
                ) {
                  return Hotel.fromJson(hotel);
                }).toList(),
            message: 'Hotels fetched succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<Hotel>>> showHotelById(
    int id,
  ) async {
    try {
      final response = await _dio.get(
        '${UserHotelEndpoints.showHotelById}/$id',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<Hotel>(
            data: Hotel.fromJson(response.data),
            message: 'Hotel fetched succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<Hotel>>> rateHotel(
    int id,
    int ratingCount,
    String comment,
  ) async {
    try {
      final response = await _dio.get(
        '${UserHotelEndpoints.hotelEvaluation}/$id',
        queryParameters: {'rating': ratingCount, 'comment': comment},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<Hotel>(
            message: 'Hotel rated succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Hotel>>>>
  showHotelsByLocation(String location) async {
    try {
      final response = await _dio.get(
        UserHotelEndpoints.showHotelByLocation,
        queryParameters: {'location': location},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Hotel>>(
            data:
                (response.data['elements'] ?? []).map((hotel) {
                  return Hotel.fromJson(hotel);
                }).toList(),
            message: 'Hotels fetched succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Hotel>>>>
  filterHotelsByRating(String location) async {
    try {
      final response = await _dio.get(UserHotelEndpoints.filterByRating);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Hotel>>(
            data:
                (response.data['elements'] ?? []).map((hotel) {
                  return Hotel.fromJson(hotel);
                }).toList(),
            message: 'Hotels filtered succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Hotel>>>>
  showNearbyHotels() async {
    try {
      final response = await _dio.get(UserHotelEndpoints.showHotelDirect);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Hotel>>(
            data:
                ((response.data['elements'] ?? []) as List<dynamic>).map((
                  hotel,
                ) {
                  return Hotel.fromJson(hotel);
                }).toList(),
            message: 'Hotels fetched succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> bookRooms(
    int hotelID,
    BookingRoomsRequest request,
  ) async {
    try {
      final response = await _dio.post(
        '${UserHotelEndpoints.booking}/$hotelID',
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'hotel rooms booked succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> directRoomBooking(
    int hotelID,
    int roomId,
  ) async {
    try {
      final response = await _dio.post(
        '${UserHotelEndpoints.booking}/$hotelID',
        queryParameters: {'roomId': roomId},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'room booked succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> cancelBooking(
    int bookingID,
  ) async {
    try {
      final response = await _dio.post(
        '${UserHotelEndpoints.booking}/$bookingID',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'booking canceled succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> showReservations(
    BookingStatus status,
  ) async {
    try {
      final path =
          status.isActive
              ? UserHotelEndpoints.showActiveReservation
              : status.isCanceled
              ? UserHotelEndpoints.showCanceledReservation
              : UserHotelEndpoints.showIncorrectReservation;
      final response = await _dio.get(path);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Reservations fetched succesfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Some error happened');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.toString()));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }
}
