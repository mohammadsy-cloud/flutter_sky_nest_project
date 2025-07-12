import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/usecases/authentication/view/pages/forgot_password_page.dart';
import 'package:sky_nest/usecases/authentication/view/pages/login_page.dart';
import 'package:sky_nest/usecases/authentication/view/pages/on_boarding_page.dart';
import 'package:sky_nest/usecases/authentication/view/pages/register_page.dart';
import 'package:sky_nest/usecases/authentication/view/pages/reset_password_page.dart';
import 'package:sky_nest/usecases/authentication/view/pages/verification_code_page.dart';
import 'package:sky_nest/usecases/home/model/room.dart';
import 'package:sky_nest/usecases/home/view/pages/browse_hotels_by_country_page.dart';
import 'package:sky_nest/usecases/home/view/pages/browse_hotels_page.dart';
import 'package:sky_nest/usecases/home/view/pages/change_password_page.dart';
import 'package:sky_nest/usecases/home/view/pages/confirm_reservation_page.dart';
import 'package:sky_nest/usecases/home/view/pages/hotel_info_page.dart';
import 'package:sky_nest/usecases/home/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../usecases/authentication/view/pages/choose_location_page.dart';
import '../../usecases/authentication/view/pages/splash_page.dart';
import '../../usecases/authentication/view/pages/verification_code_change_page.dart';
import '../../usecases/home/model/hotel.dart';
import '../../usecases/home/view/pages/cart_hotel_rooms_page.dart';
import '../../usecases/home/view/pages/edit_profile_page.dart';
import '../../usecases/home/view/pages/hotel_places_page.dart';
import '../../usecases/home/view/pages/hotel_rooms_page.dart';
import '../../usecases/home/view/pages/my_wallet_page.dart';
import '../../usecases/home/view/pages/notifications_page.dart';
import '../../usecases/home/view/pages/photos_page.dart';
import '../../usecases/home/view/pages/reservaion_page.dart';

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
        path: '/choose_location/:lat/:long',
        pageBuilder: (context, state) {
          final lat = state.pathParameters['lat'];
          final long = state.pathParameters['long'];
          return MaterialPage(
            child: ChooseLocationPage(
              initialLat: double.tryParse(lat ?? '35.00'),
              initialLong: double.tryParse(long ?? '35.00'),
            ),
          );
        },
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
        name: Routes.hotelRooms,
        path: '/hotel_rooms',
        pageBuilder: (context, state) {
          final hotel = state.extra as Hotel;
          return MaterialPage(child: HotelRoomsPage(hotel: hotel));
        },
      ),
      GoRoute(
        name: Routes.hotelPlaces,
        path: '/hotel_places',
        pageBuilder: (context, state) {
          final hotel = state.extra as Hotel;
          return MaterialPage(child: HotelPlacesPage(hotel: hotel));
        },
      ),
      GoRoute(
        name: Routes.photos,
        path: '/photos',
        pageBuilder: (context, state) {
          final photos = state.extra as List<String>;
          return MaterialPage(child: PhotosPage(photos: photos));
        },
      ),
      GoRoute(
        name: Routes.notifications,
        path: '/notifications',
        pageBuilder: (context, state) {
          return MaterialPage(child: NotificationsPage());
        },
      ),
      GoRoute(
        name: Routes.cartHotelRooms,
        path: '/cart_hotel_rooms',
        pageBuilder: (context, state) {
          final hotel = state.extra as Hotel;
          return MaterialPage(child: CartHotelRoomsPage(hotel: hotel));
        },
      ),
      GoRoute(
        name: Routes.completeReservation,
        path: '/complete_reservation',
        pageBuilder: (context, state) {
          return MaterialPage(child: ReservaionPage());
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
        path: '/hotel_info',
        pageBuilder: (context, state) {
          final hotel = state.extra as Hotel;

          return MaterialPage(child: HotelInfoPage(hotel: hotel));
        },
      ),
      GoRoute(
        name: Routes.changePassword,
        path: '/change_password',
        pageBuilder: (context, state) {
          return MaterialPage(child: ChangePasswordPage());
        },
      ),
      GoRoute(
        name: Routes.myWallet,
        path: '/my_wallet',
        pageBuilder: (context, state) {
          return MaterialPage(child: MyWalletPage());
        },
      ),
      GoRoute(
        name: Routes.editPrfile,
        path: '/edit_profile',
        pageBuilder: (context, state) {
          return MaterialPage(child: EditProfilePage());
        },
      ),
    ],
  );

  static GoRouter get instance => _goRouter;
}
