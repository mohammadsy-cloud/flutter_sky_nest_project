import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sky_nest/usecases/home/model/image_model.dart';

part 'flight.freezed.dart';
part 'flight.g.dart';

@freezed
sealed class Flight with _$Flight {
  factory Flight({
    int? id,
    String? startingPoint,
    String? destination,
    String? status,
    DateTime? destinationDate,
    DateTime? startingPointDate,
    int? numberOfChairs,
    int? numberOfEmptyChairs,
    String? tripType,
    String? airportName,
    double? basePrice,
    double? currentPrice,
    String? flightStatus,
    List<ImageModel>? flightImage,
  }) = _Flight;

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
}
