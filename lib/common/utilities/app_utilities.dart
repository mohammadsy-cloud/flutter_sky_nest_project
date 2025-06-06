import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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

Future<String?> getAddressFromLatLng(double lat, double lng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks.first;

      String address = '${place.administrativeArea}, ${place.country}';

      return address;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
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
