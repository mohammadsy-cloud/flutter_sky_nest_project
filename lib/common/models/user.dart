import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  factory User({
    int? id,
    @JsonKey(name: 'full_name') String? fullName,
    String? email,
    double? longitude,
    double? latitude,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
