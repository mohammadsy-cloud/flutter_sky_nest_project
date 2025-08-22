import 'dart:developer';

import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../common/utilities/app_utilities.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key, this.initialLong, this.initialLat});
  final double? initialLong;
  final double? initialLat;

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
    // _choosenLocation = LatLng(
    //   widget.initialLat ?? 33.513591,
    //   widget.initialLong ?? 36.304103,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pop<LatLng>(_choosenLocation);
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
          initialCenter: _choosenLocation ?? LatLng(33.399146, 36.37048),
          initialZoom: 15.0,
          onTap: (tapPosition, point) {
            setState(() {
              _choosenLocation = point;
              _mapController.moveAndRotate(point, 15, 0);
              log(_choosenLocation.toString());
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
            subdomains: ['a', 'b', 'c', 'd'],
            retinaMode: RetinaMode.isHighDensity(context),
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
                _resetRotation();
              }
            },
            child: Icon(Icons.compass_calibration),
          ),

          FloatingActionButton(
            onPressed: () async {
              await _fetchUserLocation();
            },
            child: Icon(Icons.my_location_outlined),
          ),
        ],
      ),
    );
  }

  void _resetRotation() {
    _mapController.rotate(0.0);
  }

  Future<void> _fetchUserLocation() async {
    final userLocation = await getUserLocation();
    if (userLocation != null) {
      _mapController.move(userLocation, 15.0);
      setState(() {
        _choosenLocation = userLocation;
      });
    }
  }

  LatLng? _choosenLocation;

  final _mapController = MapController();
}
