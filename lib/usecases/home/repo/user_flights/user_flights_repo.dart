import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_endpoints.dart';

import '../../../../common/models/custom_failure.dart';
import '../../../../common/models/custom_response.dart';
import '../../../../common/utilities/enumirations.dart';
import '../../model/flight.dart';
import 'requests/search_by_sd_all_request.dart';
import 'requests/search_flights_by_date_and_location_request.dart';

class UserFlightsRepo {
  Future<Either<CustomFailure, CustomResponse<List<Flight>>>>
  showAllFlights() async {
    try {
      final response = await _dio.get(UserFlightsEndpoints.viewFlights);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Flight>>(
            data:
                (response.data['elements'] as List<dynamic>).map((flight) {
                  return Flight.fromJson(flight);
                }).toList(),
            message: 'Flights fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flights are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Flight>>>>
  searchFlightsBySAndD(SearchBySdAllRequest request) async {
    try {
      final response = await _dio.get(
        UserFlightsEndpoints.searchByStartingAndEndingPointInAll,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Flight>>(
            data:
                (response.data['elements'] as List<dynamic>).map((flight) {
                  return Flight.fromJson(flight);
                }).toList(),
            message: 'Flights fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flights are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Flight>>>>
  searchFlightsByDateAndLocation(
    SearchFlightsByDateAndLocationRequest request,
  ) async {
    try {
      final response = await _dio.get(
        UserFlightsEndpoints.searchAvailableFlightsForDateAndLocation,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Flight>>(
            data:
                (response.data['elements'] as List<dynamic>).map((flight) {
                  return Flight.fromJson(flight);
                }).toList(),
            message: 'Flights fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flights are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Flight>>>>
  searchFlightsBySAndDInOne(SearchBySdAllRequest request, int airportId) async {
    try {
      final response = await _dio.get(
        '${UserFlightsEndpoints.searchByStartingAndEndingPoint}/$airportId',
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Flight>>(
            data:
                (response.data['elements'] as List<dynamic>).map((flight) {
                  return Flight.fromJson(flight);
                }).toList(),
            message: 'Flights fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flights are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Flight>>>> showActiveFlights(
    BookingStatus status,
  ) async {
    try {
      final response = await _dio.get(
        status.isActivated
            ? UserFlightsEndpoints.viewActiveFlight
            : status.isCanceled
            ? UserFlightsEndpoints.viewCanceledFlight
            : UserFlightsEndpoints.viewIncorrectFlight,
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Flight>>(
            data:
                (response.data['elements'] as List<dynamic>).map((flight) {
                  return Flight.fromJson(flight);
                }).toList(),
            message: 'Flights fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flights are not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<Flight>>> viewFlightDetails(
    int flightId,
  ) async {
    try {
      final response = await _dio.get(
        '${UserFlightsEndpoints.viewFlightDetails}/$flightId',
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<Flight>(
            data: Flight.fromJson(response.data),
            message: 'Flight fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Flight is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  final _dio = ApiService().instance;
}
