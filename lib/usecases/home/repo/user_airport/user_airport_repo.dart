import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/repo/user_airport/user_airport_endpoints.dart';

import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import 'requests/flight_reservation_request.dart';
import 'requests/rate_airport_request.dart';

class UserAirportRepo {
  Future<Either<CustomFailure, CustomResponse<List<Airport>>>>
  viewAllAirports() async {
    try {
      final response = await _dio.get(UserAirportEndpoints.viewAllAirports);
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

  Future<Either<CustomFailure, CustomResponse<List<Airport>>>>
  viewNearUserAirports() async {
    try {
      final response = await _dio.get(UserAirportEndpoints.viewNearUserAirport);
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

  Future<Either<CustomFailure, CustomResponse<List<Airport>>>>
  filterAirportsByRating() async {
    try {
      final response = await _dio.get(
        UserAirportEndpoints.filterAirportByRating,
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

  Future<Either<CustomFailure, CustomResponse<Airport>>> viewCertainAirport(
    int airportId,
  ) async {
    try {
      final response = await _dio.get(
        '${UserAirportEndpoints.viewCertainAirport}/$airportId',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<Airport>(
            message: 'Airport fetched successfully',
            statusCode: response.statusCode ?? 500,
            data: Airport.fromJson(response.data),
          ),
        );
      } else {
        throw Exception('Airport is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Airport>>>>
  searchAirportsByName(String query) async {
    try {
      final response = await _dio.get(
        UserAirportEndpoints.searchByName,
        queryParameters: {'airportName': query},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Airport>>(
            message: 'Airport fetched successfully',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((airport) {
                  return Airport.fromJson(airport);
                }).toList(),
          ),
        );
      } else if ((response.statusCode ?? 500) == 400) {
        return Right(
          CustomResponse<List<Airport>>(
            message: 'Airport fetched successfully',
            statusCode: response.statusCode ?? 500,
            data: [],
          ),
        );
      } else {
        throw Exception('Airport is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> flightReservation(
    FlightReservationRequest request,
  ) async {
    try {
      final response = await _dio.post(
        UserAirportEndpoints.flightReservation,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Flight reserved successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flight is not reserved');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> airportRating(
    RateAirportRequest request,
  ) async {
    try {
      final response = await _dio.post(
        UserAirportEndpoints.airportEvaluation,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Airport rated successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Airport is not rated');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> cancelFlightBooking(
    int fightBookingId,
  ) async {
    try {
      final response = await _dio.post(
        UserAirportEndpoints.cancelFlightBooking,
        queryParameters: {'fightBookingId': fightBookingId},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Flight booking cancelled successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flight booking is not cancelled');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  final _dio = ApiService().instance;
}
