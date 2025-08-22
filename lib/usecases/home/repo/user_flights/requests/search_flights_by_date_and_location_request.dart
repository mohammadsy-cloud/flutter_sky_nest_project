import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utilities/date_only_converter.dart';

part 'search_flights_by_date_and_location_request.freezed.dart';
part 'search_flights_by_date_and_location_request.g.dart';

@freezed
sealed class SearchFlightsByDateAndLocationRequest
    with _$SearchFlightsByDateAndLocationRequest {
  factory SearchFlightsByDateAndLocationRequest({
    required String startPoint,
    required String destination,
    @DateOnlyConverter() required DateTime userDate,
  }) = _SearchFlightsByDateAndLocationRequest;

  factory SearchFlightsByDateAndLocationRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$SearchFlightsByDateAndLocationRequestFromJson(json);
}
