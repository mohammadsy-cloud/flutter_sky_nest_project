import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_divider.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/view/widgets/profile/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: 20),
          _buildProfileItems(),
          SizedBox(height: screenHeight(context) * 0.05),
          _buildButton(context),
          // SizedBox(height: screenHeight(context) * 0.15),
        ],
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
          title: 'Profile item',

          icon: Icons.edit_square,
          onTap: () {},
        ),
        CustomDivider(spacing: 0, spacingBottom: 10),
        ProfileItemWidget(
          title: 'Profile item',

          icon: Icons.edit_square,
          onTap: () {},
        ),
        CustomDivider(spacing: 0, spacingBottom: 10),
        ProfileItemWidget(
          title: 'Profile item',

          icon: Icons.edit_square,
          onTap: () {},
        ),
        CustomDivider(spacing: 0, spacingBottom: 10),
        ProfileItemWidget(
          title: 'Profile item',

          icon: Icons.edit_square,
          onTap: () {},
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                'Mohammad Dakhlallah',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              Text(
                context.read<AuthenticationBloc>().state.user?.email ??
                    'noemail.gmail.com',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            ],
          ),
          IconButton.outlined(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.black),
              ),
            ),
            color: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
