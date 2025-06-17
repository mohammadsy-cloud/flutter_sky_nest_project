import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/services/dependency_manager/dependency_manager.dart';

class CustomDioInterceptor extends Interceptor {
  static CustomDioInterceptor? _singleton;

  CustomDioInterceptor._private();

  factory CustomDioInterceptor() {
    return _singleton ??= CustomDioInterceptor._private();
  }
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      final String? token =
          DependencyManager.instance<AuthenticationBloc>().state.token;
      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// Maps custom response
    final responseData = responseMapper(
      requestOptions: response.requestOptions,
      response: response,
    );

    return handler.resolve(responseData);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// Gets custom error message
    final errorMessage = getErrorMessage(err.type, err.response?.statusCode);

    /// Maps custom response
    final responseData = responseMapper(
      isError: true,
      customMessage: errorMessage,
      response: err.response,
      requestOptions: err.requestOptions,
    );

    return handler.resolve(responseData);
  }
}

String getErrorMessage(DioExceptionType errorType, int? statusCode) {
  String errorMessage = "";
  switch (errorType) {
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.connectionTimeout:
      errorMessage = DioExceptionMessage.deadlineExceededException;
      break;
    case DioExceptionType.badResponse:
      switch (statusCode) {
        case 400:
          errorMessage = DioExceptionMessage.badRequestException;
          break;
        case 401:
          errorMessage = DioExceptionMessage.unauthorizedException;
          break;
        case 404:
          errorMessage = DioExceptionMessage.notFoundException;
          break;
        case 409:
          errorMessage = DioExceptionMessage.conflictException;
          break;
        case 500:
          errorMessage = DioExceptionMessage.internalServerErrorException;
          break;
      }
      break;
    case DioExceptionType.cancel:
      break;
    default:
      errorMessage = DioExceptionMessage.unexpectedException;
      break;
  }
  return errorMessage;
}

class DioExceptionMessage {
  static const badRequestException = "Invalid request";
  static const internalServerErrorException =
      "Unknown error occurred, please try again later.";
  static const conflictException = "Conflict occurred";
  static const unauthorizedException = "Access denied";
  static const notFoundException =
      "The requested information could not be found";
  static const unexpectedException = "Unexpected error occurred.";
  static const noInternetConnectionException =
      "No internet connection detected, please try again.";
  static const deadlineExceededException =
      "The connection has timed out, please try again.";
}

Response<dynamic> responseMapper({
  Response<dynamic>? response,
  required RequestOptions requestOptions,
  String customMessage = "",
  bool isError = false,
}) {
  final bool hasData = response?.data != null;

  Map<String, dynamic>? responseData = {};
  if (response?.data is List<dynamic>) {
    responseData.addAll({"elements": response?.data});
  } else if (response?.data is String) {
    responseData.addAll({'message': response?.data});
  } else {
    responseData = response?.data;
  }

  if (hasData) {
    responseData!.addAll({
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage,
    });
  }

  return Response(
    requestOptions: requestOptions,
    headers: response?.headers,
    statusCode: response?.statusCode,
    statusMessage: response?.statusMessage,
    data:
        hasData
            ? responseData
            : {
              'message': customMessage,
              'success': isError ? false : true,
              'statusCode': response?.statusCode,
              'statusMessage': response?.statusMessage,
            },
  );
}
