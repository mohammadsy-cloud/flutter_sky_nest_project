import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/cubits/location_cubit/location_cubit.dart';
import 'package:sky_nest/common/repos/authentication_repo.dart';

import '../../../custom_bloc_observer.dart';

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
    _instance.registerLazySingleton<AuthenticationRepo>(
      () => AuthenticationRepo(),
    );
    _instance.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(
        authenticationRepo: _instance<AuthenticationRepo>(),
      ),
    );
    _instance.registerLazySingleton<LocationCubit>(
      () => LocationCubit(authBloc: _instance<AuthenticationBloc>()),
    );
  }

  static GetIt get instance => _instance;

  static final GetIt _instance = GetIt.instance;
}
