import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as l;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
bool validateFormKey(GlobalKey<FormState> key) => key.currentState!.validate();
Future<LatLng?> getUserLocation() async {
  l.Location location = l.Location();

  // Check permission
  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      log('Location service not enabled');
      return null;
    }
  }

  l.PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == l.PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != l.PermissionStatus.granted) {
      log('Location permission not granted');
      return null;
    }
  }

  // Get current location
  l.LocationData locationData = await location.getLocation();
  return LatLng(locationData.latitude!, locationData.longitude!);
}

Future<String?> getAddressFromLatLng(double lng, double lat) async {
  try {
    final url = 'https://nominatim.openstreetmap.org/reverse';

    final response = await Dio(
      BaseOptions(
        headers: {'User-Agent': 'flutter-app'},
        connectTimeout: const Duration(seconds: 12),
        receiveTimeout: const Duration(seconds: 12),
      ),
    ).get(
      url,
      queryParameters: {
        'lat': lat,
        'format': 'jsonv2',
        'lon': lng,
        'accept-language': 'en',
      },
    );

    final data = response.data;
    log(data.toString());

    if (data != null && data['address'] != null) {
      final addr = data['address'];

      final country = addr['country'];
      final district = addr['city'] ?? addr['suburb'];
      final state = addr['state'];

      // Build the custom formatted address
      return [district, state, country].where((e) => e != null).join(', ');
    }
  } catch (e) {
    log(e.toString());
  }

  return null;
}

bool checkIfEmpty(String? string) {
  return string == null || string.trim().isEmpty;
}

bool isValidEmail(String? email) {
  if (email == null || email.isEmpty) return false;

  // More comprehensive regex pattern
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);

  return regex.hasMatch(email);
}

void myShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(SnackBar(content: Text(message)));
}

String getMapSnapshot(LatLng location) {
  final lat = location.latitude;
  final long = location.longitude;
  return 'https://static-maps.yandex.ru'
      '/1.x/?ll=$lat,$long&size=650,450&z=15'
      '&l=map&pt=$lat,$long,pm2rdl';
}

Future<String?> pickDateAndFormatIt(
  BuildContext context, [
  DateTime? startDate,
]) async {
  final date = await showDatePicker(
    context: context,
    firstDate: (startDate ?? DateTime.now()).add(Duration(days: 1)),
    lastDate: (startDate ?? DateTime.now()).add(Duration(days: 30)),
  );
  if (date != null) {
    return formatDate(date);
  } else {
    return null;
  }
}

String formatDate(DateTime date) {
  return DateFormat.yMMMMEEEEd().format(date);
}
