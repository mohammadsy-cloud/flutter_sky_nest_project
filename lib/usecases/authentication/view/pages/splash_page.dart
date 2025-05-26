import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          color: Theme.of(context).colorScheme.primary,
          'assets/images/app_logo_skynest.png',
          width: screenWidth(context) * 0.62,
          height: screenHeight(context) * 0.25,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
