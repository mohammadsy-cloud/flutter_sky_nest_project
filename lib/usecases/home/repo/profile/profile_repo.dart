import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sky_nest/common/models/custom_response.dart';
import 'package:sky_nest/common/models/user.dart';
import 'package:sky_nest/usecases/home/repo/profile/profile_endpoints.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';

import '../../../../common/models/custom_failure.dart';
import 'requests/edit_profile_request.dart';

class ProfileRepo {
  ProfileRepo({Dio? dio}) : _dio = ApiService().instance;

  Future<Either<CustomFailure, CustomResponse<User>>> getMyProfile() async {
    try {
      final response = await _dio.get(ProfileEndpoints.profile);
      log(response.data.toString());
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<User>(
            data: User.fromJson(response.data),
            message: 'My Profile fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('My Profile is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<User>>> getOtherUserProfile(
    int userId,
  ) async {
    try {
      final response = await _dio.get('${ProfileEndpoints.prefix}/$userId');
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<User>(
            data: User.fromJson(response.data),
            message: 'My Profile fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('My Profile is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<double>>>
  viewTotalBalance() async {
    try {
      final response = await _dio.get(ProfileEndpoints.viewTotalBalance);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<double>(
            data: response.data['totalBalance'],
            message: 'Balance fetched successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Balance is not fetched');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> editProfile(
    EditProfileRequest request,
  ) async {
    try {
      final response = await _dio.post(
        ProfileEndpoints.editProfile,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Profile updated successfully',
            statusCode: response.statusCode ?? 500,
          ),
        );
      } else {
        throw Exception('Profile is not updated');
      }
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  final Dio _dio;
}
