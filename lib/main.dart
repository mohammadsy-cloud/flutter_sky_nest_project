import 'package:demo_project/usecases/authentication/view/pages/splash_page.dart';
import 'package:demo_project/usecases/home/view/pages/main_page.dart';

import 'common/navigation/routes.dart';
import 'common/theme/global_theme.dart';
import 'usecases/authentication/view/pages/forgot_password_page.dart';
import 'usecases/authentication/view/pages/login_page.dart';
import 'usecases/authentication/view/pages/on_boarding_page.dart';
import 'usecases/authentication/view/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'usecases/home/view/pages/browse_hotels_by_country_page.dart';
import 'usecases/home/view/pages/browse_hotels_page.dart';
import 'usecases/home/view/pages/confirm_reservation_page.dart';
import 'usecases/home/view/pages/hotel_info_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: GlobalTheme.appLightTheme,
      darkTheme: GlobalTheme.appDarkTheme,
      initialRoute: Routes.onBoarding,
      // home: ConfirmReservationPage(hotelName: 'Sheraton'),
      routes: {
        Routes.registerRoute: (_) => RegisterPage(),
        Routes.loginRoute: (_) => LoginPage(),
        Routes.forgotPasswordRoute: (_) => ForgotPasswordPage(),
        Routes.mainRoute: (_) => MainPage(),
        Routes.browseHotelsRoute: (_) => BrowseHotelsPage(),
        Routes.splashRoute: (_) => SplashPage(),
        Routes.onBoarding: (_) => OnBoardingPage(),
      },
    ),
  );
}
