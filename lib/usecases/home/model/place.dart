import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/image_model.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
sealed class Place with _$Place {
  factory Place({
    int? placeId,
    String? placeName,
    String? placeDescription,
    List<ImageModel>? imagePlaceList,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
