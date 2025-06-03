import 'dart:developer';

import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../common/utilities/app_utilities.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  @override
  void initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
    _choosenLocation = LatLng(
      _authenticationBloc!.state.user?.latitude ?? 33.513591,
      _authenticationBloc!.state.user?.longitude ?? 36.304103,
    );
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = context.read<AuthenticationBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _authenticationBloc!.add(
                AuthAddLocation(
                  lat: _choosenLocation!.latitude,
                  long: _choosenLocation!.longitude,
                ),
              );
              context.pop();
            },
            iconSize: 30,
            icon: Icon(Icons.check),
          ),
        ],
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text('Choose location on map'),
        titleTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      body: FlutterMap(
        mapController: _mapController,
        key: _choosenLocation == null ? null : ObjectKey(_choosenLocation!),
        options: MapOptions(
          initialCenter: _choosenLocation ?? LatLng(33.513591, 36.304103),
          initialZoom: 15.0,
          initialRotation: _currentRotation,
          onTap: (tapPosition, point) {
            setState(() {
              _choosenLocation = point;
              log(_choosenLocation.toString());
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
            tileProvider: NetworkTileProvider(),
          ),
          if (_choosenLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: _choosenLocation!,
                  child: const Icon(
                    Icons.location_pin,
                    size: 40,
                    color: Colors.red,
                  ), // Icon
                ), // Marker
              ],
            ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final userLocation = await getUserLocation();
              if (userLocation != null) {
                setState(() {
                  _choosenLocation = userLocation;
                });
              }
            },
            child: Icon(Icons.compass_calibration),
          ),

          FloatingActionButton(
            onPressed: () async {
              final userLocation = await getUserLocation();
              if (userLocation != null) {
                setState(() {
                  _choosenLocation = userLocation;
                });
              }
            },
            child: Icon(Icons.my_location_outlined),
          ),
        ],
      ),
    );
  }

  void resetRotation() {
    setState(() {
      _currentRotation = 0.0;
    });
  }

  LatLng? _choosenLocation;
  double _currentRotation = 0.0;

  final _mapController = MapController();
  AuthenticationBloc? _authenticationBloc;
}
