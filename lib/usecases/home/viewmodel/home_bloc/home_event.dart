part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.nearbyHotelsFetched() = NearbyHotelsFetched;
  const factory HomeEvent.nearbyFlightsFetched() = NearbyFlightsFetched;
}
