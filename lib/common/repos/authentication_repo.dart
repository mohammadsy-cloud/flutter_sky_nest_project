import 'dart:developer';

import 'package:sky_nest/common/models/custom_failure.dart';
import 'package:sky_nest/common/models/custom_response.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/repos/authentication_endpoints.dart';
import 'package:sky_nest/common/repos/requests/register_request.dart';
import 'package:sky_nest/common/repos/requests/verify_otp_request.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

import '../models/user.dart';
import 'requests/change_password_email_request.dart';
import 'requests/change_password_request.dart';
import 'requests/login_request.dart';

class AuthenticationRepo {
  final Dio _dio;

  Future<Either<CustomFailure, CustomResponse>> signUp(
    RegisterRequest request,
  ) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.signUp,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message:
                'Successfully Added! \n'
                'we will send code to your email to be verified',
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'registration is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> changePasswordEmail(
    ChangePasswordEmailRequest request,
  ) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.changePasswordEmail,
        queryParameters: {'email': request.email},
      );

      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'we will send code to your email to be verified',
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'change password is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> changePasswordVerify(
    VerifyOtpRequest request,
  ) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.changePasswordCode,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Email verified successfully',
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'registration is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<String>>> changePassword(
    ChangePasswordRequest request,
  ) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.changePassword,
        queryParameters: {'email': request.email, 'password': request.password},
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Password changed successfully',
            data: response.data['token'],
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'change password is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<String>>> logIn(
    LoginRequest request,
  ) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.login,
        data: request.toJson(),
      );
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<String>(
            data: response.data['token'],
            message: 'Successfully logged in!',
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'login is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse>> logout() async {
    try {
      final response = await _dio.delete(AuthenticationEndpoints.logout);
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Successfully logged out!',
            statusCode: response.statusCode!,
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'login is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<String>>> verifyOTP({
    required VerifyOtpRequest request,
  }) async {
    try {
      final response = await _dio.post(
        AuthenticationEndpoints.verifyOTP,
        data: request.toJson(),
      );
      log(response.data.toString());
      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse(
            message: 'Email verified successfully!',
            statusCode: response.statusCode!,
            data: response.data['token'],
          ),
        );
      }
      return Left(
        CustomFailure(
          message: 'registration is not complete',
          stackTrace: StackTrace.current,
        ),
      );
    } on DioException catch (e) {
      return Left(CustomFailure(message: e.message ?? 'Some error'));
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  AuthenticationRepo({Dio? dio}) : _dio = dio ?? ApiService().instance;
}
