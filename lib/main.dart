import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/go_router_configuration.dart';
import 'package:sky_nest/common/repos/authentication_repo.dart';
import 'package:sky_nest/custom_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/cubits/location_cubit/location_cubit.dart';
import 'common/theme/global_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthenticationRepo())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => AuthenticationBloc(
                  authenticationRepo: context.read<AuthenticationRepo>(),
                ),
          ),
          BlocProvider(
            create:
                (context) =>
                    LocationCubit(authBloc: context.read<AuthenticationBloc>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: GlobalTheme.appLightTheme,
          darkTheme: GlobalTheme.appDarkTheme,
          routerConfig: GlobalAppRouter.instance,
        ),
      ),
    ),
  );
}
