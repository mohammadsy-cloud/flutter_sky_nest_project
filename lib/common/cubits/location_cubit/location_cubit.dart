import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../utilities/app_utilities.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required AuthenticationBloc authBloc})
    : _authenticationBloc = authBloc,
      super(LocationState.initial());

  Future<void> fetchUserLocation() async {
    try {
      final newLocation = await getUserLocation();

      if (newLocation != null) {
        _authenticationBloc.add(
          AuthenticationEvent.addLocation(
            lat: newLocation.latitude,
            long: newLocation.longitude,
          ),
        );
      }
    } catch (e) {
      emit(state);
    }
  }

  final AuthenticationBloc _authenticationBloc;
}
