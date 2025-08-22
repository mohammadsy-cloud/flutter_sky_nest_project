import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_by_sd_all_request.freezed.dart';
part 'search_by_sd_all_request.g.dart';

@freezed
sealed class SearchBySdAllRequest with _$SearchBySdAllRequest {
  factory SearchBySdAllRequest({
    required String startPoint,
    required String destination,
  }) = _SearchBySdAllRequest;

  factory SearchBySdAllRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchBySdAllRequestFromJson(json);
}
