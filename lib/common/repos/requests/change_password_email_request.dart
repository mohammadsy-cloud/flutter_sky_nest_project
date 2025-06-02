import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_email_request.freezed.dart';
part 'change_password_email_request.g.dart';

@freezed
sealed class ChangePasswordEmailRequest with _$ChangePasswordEmailRequest {
  factory ChangePasswordEmailRequest({required String email}) =
      _ChangePasswordEmailRequest;

  factory ChangePasswordEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordEmailRequestFromJson(json);
}
