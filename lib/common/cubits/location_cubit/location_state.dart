part of 'location_cubit.dart';

@freezed
sealed class LocationState with _$LocationState {
  const factory LocationState({LatLng? location}) = _LocationState;
  factory LocationState.initial() {
    return LocationState();
  }
}
