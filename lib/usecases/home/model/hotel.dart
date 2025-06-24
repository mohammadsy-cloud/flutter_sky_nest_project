import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
sealed class Hotel with _$Hotel {
  factory Hotel({
    int? id,
    String? name,
    String? description,
    String? address,
    double? avgRating,
    int? ratingCount,
    List<ImageModel>? imageDTOList,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
