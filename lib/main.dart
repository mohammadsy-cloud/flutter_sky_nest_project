import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/go_router_configuration.dart';
import 'package:sky_nest/common/repos/authentication/authentication_repo.dart';
import 'package:sky_nest/common/services/dependency_manager/dependency_manager.dart';
import 'package:sky_nest/custom_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_nest/usecases/home/viewmodel/home_bloc/home_bloc.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';

import 'common/cubits/location_cubit/location_cubit.dart';
import 'common/theme/global_theme.dart';
import 'package:flutter/material.dart';

import 'usecases/home/view/pages/change_password_page.dart';
import 'usecases/home/view/widgets/profile/profile_page.dart';

void main() async {
  await DependencyManager.setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: DependencyManager.instance<AuthenticationBloc>(),
        ),
        BlocProvider.value(value: DependencyManager.instance<LocationCubit>()),
        BlocProvider.value(value: DependencyManager.instance<HomeBloc>()),
        BlocProvider.value(value: DependencyManager.instance<ProfileBloc>()),
      ],
      child:
      //  MaterialApp(
      //   home: ChangePasswordPage(),
      //   debugShowCheckedModeBanner: false,
      //   themeMode: ThemeMode.system,
      //   theme: AppTheme.light,
      //   darkTheme: AppTheme.dark,
      // ),
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: GlobalAppRouter.instance,
      ),
    ),
  );
}
