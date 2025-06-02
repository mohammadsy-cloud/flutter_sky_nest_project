import 'package:demo_project/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:demo_project/common/navigation/routes.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/cubits/location_cubit/location_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      context.read<LocationCubit>().fetchUserLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight(context) * 0.35),
            Image.asset(
              color: Theme.of(context).colorScheme.primary,
              'assets/images/app_logo_skynest.png',
              width: screenWidth(context) * 0.62,
              height: screenHeight(context) * 0.25,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: screenHeight(context) * 0.24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  screenWidth(context) * 0.45,
                  screenHeight(context) * 0.08,
                ),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                context.goNamed(Routes.onBoarding);
              },
              icon: Icon(Icons.arrow_forward),
              label: Text('Explore', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
