import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_airport_request.freezed.dart';
part 'rate_airport_request.g.dart';

@freezed
sealed class RateAirportRequest with _$RateAirportRequest {
  factory RateAirportRequest({
    required int airportId,
    required int stars,
    required String comment,
  }) = _RateAirportRequest;

  factory RateAirportRequest.fromJson(Map<String, dynamic> json) =>
      _$RateAirportRequestFromJson(json);
}
