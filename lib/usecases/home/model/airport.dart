import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/image_model.dart';

part 'airport.freezed.dart';
part 'airport.g.dart';

@freezed
sealed class Airport with _$Airport {
  factory Airport({
    @JsonKey(name: 'airportId') int? id,
    String? name,
    String? description,
    double? latitude,
    double? longitude,
    double? avgRating,
    String? location,
    int? ratingCount,
    String? ownerName,
    List<ImageModel>? airportImages,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);
}
