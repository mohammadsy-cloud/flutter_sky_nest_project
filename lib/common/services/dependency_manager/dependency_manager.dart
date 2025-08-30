import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/cubits/location_cubit/location_cubit.dart';
import 'package:sky_nest/common/repos/authentication/authentication_repo.dart';
import 'package:sky_nest/usecases/home/repo/profile/profile_repo.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/viewmodel/home_bloc/home_bloc.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';

import '../../../custom_bloc_observer.dart';
import '../../../usecases/home/viewmodel/cart_bloc/cart_bloc.dart';
import '../../../usecases/home/viewmodel/flight_reservations_bloc/flight_reservations_bloc.dart';
import '../../../usecases/home/viewmodel/hotel_reservations_bloc/hotel_reservations_bloc.dart';
import '../notifications/notifications_service.dart';

final _firebaseMessaging = FirebaseMessaging.instance;

class DependencyManager {
  static setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = CustomBlocObserver();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:
          kIsWeb
              ? HydratedStorageDirectory.web
              : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
    _instance.registerSingleton<AuthenticationRepo>(AuthenticationRepo());
    _instance.registerSingleton<AuthenticationBloc>(
      AuthenticationBloc(authenticationRepo: _instance<AuthenticationRepo>()),
    );
    _instance.registerFactory<UserFlightsRepo>(() => UserFlightsRepo());
    _instance.registerSingleton<FlightReservationsBloc>(
      FlightReservationsBloc(userFlightsRepo: _instance<UserFlightsRepo>()),
    );
    _instance.registerLazySingleton<LocationCubit>(
      () => LocationCubit(authBloc: _instance<AuthenticationBloc>()),
    );
    _instance.registerFactory<UserHotelRepo>(() => UserHotelRepo());
    _instance.registerLazySingleton(
      () => HomeBloc(userHotelRepo: _instance<UserHotelRepo>()),
    );

    _instance.registerFactory(() => ProfileRepo());
    _instance.registerLazySingleton(
      () => ProfileBloc(profileRepo: _instance<ProfileRepo>()),
    );

    _instance.registerLazySingleton(
      () => CartBloc(userHotelRepo: _instance<UserHotelRepo>()),
    );
    _instance.registerLazySingleton(
      () => HotelReservationsBloc(userHotelRepo: _instance<UserHotelRepo>()),
    );

    await Hive.initFlutter();
    await Hive.openBox('my_box');
    await Firebase.initializeApp();

    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();

    if (token != null) {
      log('fcm_token : $token');
      Hive.box('my_box').put('fcm_token', token);
    }

    FirebaseMessaging.onMessage.listen((message) {
      final not = message.notification;
      if (not != null) {
        NotificationsService().show(
          title: not.title ?? 'No title',
          body: not.body ?? 'No body',
        );
      }
    });
  }

  static GetIt get instance => _instance;

  static final GetIt _instance = GetIt.instance;
}
