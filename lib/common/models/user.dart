import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  factory User({
    int? id,
    @JsonKey(name: 'fullName') String? fullName,
    String? email,
    double? longitude,
    double? latitude,
    int? level,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
