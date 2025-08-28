import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/common/utilities/date_only_converter.dart';

part 'show_all_rooms_request.freezed.dart';
part 'show_all_rooms_request.g.dart';

@freezed
sealed class ShowAllRoomsRequest with _$ShowAllRoomsRequest {
  factory ShowAllRoomsRequest({
    required String address,
    @DateOnlyConverter() DateTime? startDate,
    @DateOnlyConverter() DateTime? endDate,
  }) = _ShowAllRoomsRequest;

  factory ShowAllRoomsRequest.fromJson(Map<String, dynamic> json) =>
      _$ShowAllRoomsRequestFromJson(json);
}
