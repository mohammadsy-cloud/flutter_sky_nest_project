import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/usecases/home/repo/profile/requests/edit_profile_request.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/loading_indicator.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text('Change Password'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          30,
          0,
          30,
          MediaQuery.of(context).viewInsets.bottom * 0.3,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/enter_new_password.png',
                  color: Theme.of(context).colorScheme.primary,
                  // colorBlendMode: BlendMode.colorBurn,
                  height: screenHeight(context) * 0.3,
                  width: screenWidth(context) * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
              Text('New Password', style: TextStyle(fontSize: 14)),
              TextFormField(
                validator: validatePasswordWithFeedback,
                style: TextStyle(fontSize: 15),
                controller: _newPasswordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintText: 'New Password',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              Text('Confirm Password', style: TextStyle(fontSize: 14)),
              TextFormField(
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords must be mathced';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(fontSize: 15),
                controller: _confirmPasswordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintText: 'New Password',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: screenHeight(context) * 0.1),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state.status.isLoading) {
                    LoadingIndicator().show(context);
                  } else {
                    LoadingIndicator().hideAll();
                    Fluttertoast.showToast(msg: state.statusMessage);
                    if (state.status.isDone) {
                      context.pop();
                    }
                  }
                },
                builder: (context, state) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(
                        screenWidth(context),
                        screenHeight(context) * 0.08,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed:
                        state.status.isLoading
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ProfileBloc>().add(
                                  ProfileModified(
                                    request: EditProfileRequest(
                                      password: _confirmPasswordController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                    child: Text('Change Password'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}
