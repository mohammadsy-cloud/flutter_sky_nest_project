import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/common/models/custom_failure.dart';
import 'package:sky_nest/common/models/custom_response.dart';
import 'package:sky_nest/common/services/api_service/api_service.dart';

import '../../../../common/utilities/enumirations.dart';
import '../../model/notification.dart';
import '../../repo/profile/profile_endpoints.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState.initial());

  Future<void> fetchNotifications() async {
    emit(state.copyWith(status: Data.loading, statusMessage: 'Loading'));
    try {
      final response = await _fetchAllNotifications();
      final futureState = switch (response) {
        Left(value: final l) => state.copyWith(
          status: Data.error,
          statusMessage: l.message,
        ),
        Right(value: final r) => state.copyWith(
          status: Data.done,
          statusMessage: r.message,
          notifications: r.data ?? state.notifications,
        ),
      };
      emit(futureState);
    } catch (e) {
      emit(state.copyWith(status: Data.error, statusMessage: e.toString()));
    }
  }

  Future<Either<CustomFailure, CustomResponse<List<Notification>>>>
  _fetchAllNotifications() async {
    try {
      final response = await ApiService().instance.get(
        ProfileEndpoints.notifications,
      );

      if ((response.statusCode ?? 500) < 300) {
        return Right(
          CustomResponse<List<Notification>>(
            message: 'Notifications fetched successfully',
            statusCode: response.statusCode ?? 500,
            data:
                (response.data['elements'] as List<dynamic>).map((not) {
                  return Notification.fromJson(not);
                }).toList(),
          ),
        );
      } else if (response.statusCode == 400) {
        return Right(
          CustomResponse<List<Notification>>(
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
}
