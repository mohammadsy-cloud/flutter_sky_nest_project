import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
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
      context.read<AuthenticationBloc>().add(LogInWithToken());
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
            FilledButton.icon(
              style: FilledButton.styleFrom(
                fixedSize: Size(
                  screenWidth(context) * 0.45,
                  screenHeight(context) * 0.08,
                ),
                // backgroundColor: Theme.of(context).colorScheme.primary,
                // foregroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
              onPressed: () {
                context.goNamed(Routes.onBoarding);
              },
              icon: BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state.isAuthenticated) {
                    context.goNamed(Routes.mainRoute);
                  }
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  // color: Theme.of(context).colorScheme.onPrimaryFixed,
                ),
              ),
              label: Text('Explore', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
