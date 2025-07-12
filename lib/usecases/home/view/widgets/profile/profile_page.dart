import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_divider.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/view/widgets/profile/profile_item_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _profileBloc = context.read<ProfileBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        _profileBloc.add(ProfileFetched());
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 20),
            _buildProfileItems(),
            SizedBox(height: screenHeight(context) * 0.25),
            _buildButton(context),
            // SizedBox(height: screenHeight(context) * 0.15),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => !current.dataState.isEmpty,
      listener: (context, state) {
        if (state.dataState.isLoading) {
          LoadingIndicator().show(context);
        } else {
          LoadingIndicator().hideAll();
          if (state.dataState.isDone) {
            myShowSnackBar(context, state.message);
            context.goNamed(Routes.loginRoute);
          }
        }
      },
      child: FilledButton(
        style: FilledButton.styleFrom(
          fixedSize: Size(
            screenWidth(context) * 0.9,
            screenHeight(context) * 0.07,
          ),
        ),
        onPressed: () {
          context.read<AuthenticationBloc>().add(AuthLogOut());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(size: 25, Icons.login_outlined),
            Text('Log out', style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }

  Column _buildProfileItems() {
    return Column(
      children: [
        ProfileItemWidget(
          title: 'Total Balance',
          icon: Icons.account_balance_wallet_rounded,
          onTap: () {
            context.pushNamed(Routes.myWallet);
          },
        ),
        CustomDivider(spacing: 0, spacingBottom: 10),
        ProfileItemWidget(
          title: 'Change password',
          icon: Icons.lock,
          onTap: () {
            context.pushNamed(Routes.changePassword);
          },
        ),
      ],
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17),
          bottomRight: Radius.circular(17),
        ),
      ),
      height: screenHeight(context) * 0.14,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    state.user?.fullName ?? 'No user',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                  Text(
                    state.user?.email ?? 'noemail.gmail.com',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ],
              );
            },
          ),
          IconButton.outlined(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.black),
              ),
            ),
            color: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: () {
              context.pushNamed(Routes.editPrfile);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  late final ProfileBloc _profileBloc;
}
