// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/image_model.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
sealed class Room with _$Room {
  factory Room({
    int? id,
    @JsonKey(name: 'room_type') String? roomType,
    @JsonKey(name: 'room_count') int? roomCount,
    int? hotelId,
    double? basePrice,
    String? hotelName,
    String? ownerName,
    double? currentPrice,
    List<ImageModel>? imageDTOList,
    String? status,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
