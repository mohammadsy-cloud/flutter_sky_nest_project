import 'package:demo_project/common/navigation/routes.dart';
import 'package:demo_project/usecases/authentication/view/pages/forgot_password_page.dart';
import 'package:demo_project/usecases/authentication/view/pages/login_page.dart';
import 'package:demo_project/usecases/authentication/view/pages/on_boarding_page.dart';
import 'package:demo_project/usecases/authentication/view/pages/register_page.dart';
import 'package:demo_project/usecases/authentication/view/pages/reset_password_page.dart';
import 'package:demo_project/usecases/authentication/view/pages/verification_code_page.dart';
import 'package:demo_project/usecases/home/view/pages/browse_hotels_by_country_page.dart';
import 'package:demo_project/usecases/home/view/pages/browse_hotels_page.dart';
import 'package:demo_project/usecases/home/view/pages/confirm_reservation_page.dart';
import 'package:demo_project/usecases/home/view/pages/hotel_info_page.dart';
import 'package:demo_project/usecases/home/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../usecases/authentication/view/pages/choose_location_page.dart';
import '../../usecases/authentication/view/pages/splash_page.dart';
import '../../usecases/authentication/view/pages/verification_code_change_page.dart';

class GlobalAppRouter {
  static final GoRouter _goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: Routes.splashRoute,
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        name: Routes.onBoarding,
        path: '/on_boarding',
        pageBuilder: (context, state) => MaterialPage(child: OnBoardingPage()),
      ),
      GoRoute(
        name: Routes.loginRoute,
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(child: LoginPage()),
      ),
      GoRoute(
        name: Routes.registerRoute,
        path: '/register',
        pageBuilder: (context, state) => MaterialPage(child: RegisterPage()),
      ),
      GoRoute(
        name: Routes.browseHotelsRoute,
        path: '/browse_hotels',
        pageBuilder:
            (context, state) => MaterialPage(child: BrowseHotelsPage()),
      ),
      GoRoute(
        name: Routes.mainRoute,
        path: '/main_page',
        pageBuilder: (context, state) => MaterialPage(child: MainPage()),
      ),
      GoRoute(
        name: Routes.chooseLocationRoute,
        path: '/choose_location',
        pageBuilder:
            (context, state) => MaterialPage(child: ChooseLocationPage()),
      ),
      GoRoute(
        name: Routes.verificationCodeRoute,
        path: '/verify/:code/:email',
        pageBuilder: (context, state) {
          final code = int.tryParse(state.pathParameters['code'] ?? '1');
          final email = state.pathParameters['email'] ?? 'no email';

          return MaterialPage(
            child: VerificationCodePage(
              email: email,
              code: code == 1 ? null : code,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.verificationCodeChangeRoute,
        path: '/verify_change/:code/:email',
        pageBuilder: (context, state) {
          final code = int.tryParse(state.pathParameters['code'] ?? '1');
          final email = state.pathParameters['email'] ?? 'no email';

          return MaterialPage(
            child: VerificationCodeChangePage(
              email: email,
              code: code == 1 ? null : code,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.forgotPasswordRoute,
        path: '/forgot_password',
        pageBuilder: (context, state) {
          return MaterialPage(child: ForgotPasswordPage());
        },
      ),
      GoRoute(
        name: Routes.resetPasswordRoute,
        path: '/reset_password/:email',
        pageBuilder: (context, state) {
          final email = state.pathParameters['email'] ?? 'No email';
          return MaterialPage(child: ResetPasswordPage(email: email));
        },
      ),
      GoRoute(
        name: Routes.browseHotelsByCountryRoute,
        path: '/browse_hotels_by_country/:country',
        pageBuilder: (context, state) {
          final countryName = state.pathParameters['country'] ?? 'No country';
          return MaterialPage(
            child: BrowseHotelsByCountryPage(countryName: countryName),
          );
        },
      ),
      GoRoute(
        name: Routes.confirmReservationRoute,
        path: '/confirm_reservation/:hotelName',
        pageBuilder: (context, state) {
          final hotelName = state.pathParameters['hotelName'] ?? 'No hotel';
          return MaterialPage(
            child: ConfirmReservationPage(hotelName: hotelName),
          );
        },
      ),
      GoRoute(
        name: Routes.hotelInfoRoute,
        path: '/hotel_info/:hotelName',
        pageBuilder: (context, state) {
          final hotelName = state.pathParameters['hotelName'] ?? 'No hotel';
          return MaterialPage(child: HotelInfoPage(hotelName: hotelName));
        },
      ),
    ],
  );

  static GoRouter get instance => _goRouter;
}
