import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';

part 'register_request.g.dart';

@freezed
sealed class RegisterRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String email,
    required String password,
    required String fullName,
    required double longitude,
    required double latitude,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
