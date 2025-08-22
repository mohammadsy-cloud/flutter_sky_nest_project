import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as l;

import '../../usecases/home/model/image_model.dart';

String higherFirstChar(String str) {
  return str[0].toUpperCase() + str.substring(1);
}

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

String? validatePasswordWithFeedback(String? password) {
  if (password == null) {
    return 'You must enter a valid password';
  } else {
    // Check minimum length
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letters
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for numbers
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special characters
    if (!password.contains(RegExp(r'[@$!%*?&]'))) {
      return 'Password must contain at least one special character (@, \$, !, %, *, ?, &)';
    }

    // Check for maximum length (common practice)
    if (password.length > 128) {
      return 'Password cannot exceed 128 characters';
    }

    // // Check for common weak patterns
    // if (RegExp(r'(.)\1{2,}').hasMatch(password)) {
    //   return 'Password contains repeated characters';
    // }

    // if (RegExp(
    //   r'(123|abc|qwerty|password|admin)',
    // ).hasMatch(password.toLowerCase())) {
    //   return 'Password contains common weak patterns';
    // }
  }

  return null; // Password is valid
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

String findFirstImageUrl(List<ImageModel>? images) {
  if (images == null || images.isEmpty) {
    return '';
  } else {
    return images.first.imageUrl ?? '';
  }
}

Widget bestPriceWidget({
  required double basePrice,
  required double currentPrice,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text.rich(
    style: TextStyle(fontWeight: fontWeight),
    TextSpan(
      style:
          ((currentPrice) < (basePrice))
              ? TextStyle(
                decorationThickness: 2,
                decoration: TextDecoration.lineThrough,
              )
              : null,
      text:
          ((currentPrice) < (basePrice)) ? '\$ $basePrice' : '\$ $currentPrice',
      children:
          ((currentPrice) < (basePrice))
              ? [
                TextSpan(
                  text: ' \$ $currentPrice',
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              ]
              : null,
    ),
  );
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
