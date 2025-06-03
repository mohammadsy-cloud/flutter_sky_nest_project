import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/repos/requests/change_password_request.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/navigation/routes.dart';
import '../../../../common/theme/color_pallete.dart';
import '../../../../common/widgets/blurred_dialog.dart';
import '../../../../common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../common/utilities/app_utilities.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late final Size _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.sizeOf(context);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: _screenSize.height * 0.03,
          bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter New Password',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Please Enter new password',
                style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
              ),
              SizedBox(
                width: _screenSize.width,
                height: _screenSize.height * 0.35,
                child: Image.asset(
                  filterQuality: FilterQuality.high,
                  'assets/images/enter_new_password.png',
                  // color: Theme.of(context).colorScheme.primary,
                  fit: BoxFit.cover,
                ),
              ),
              CustomTextFormField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter a valid password';
                  } else {
                    return null;
                  }
                },
                label: 'Password',
                obsecureText: true,
                controller: _passwordController,
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                textInputAction: TextInputAction.done,
                label: 'Confirm Password',
                obsecureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords don\'t match';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: _screenSize.height * 0.1),
              SizedBox(
                width: _screenSize.width,
                height: _screenSize.height * 0.08,
                child: BlocListener<AuthenticationBloc, AuthenticationState>(
                  listenWhen: (previous, current) => !current.dataState.isEmpty,
                  listener: (context, state) async {
                    if (state.dataState.isLoading) {
                      LoadingIndicator().show(context);
                    } else {
                      LoadingIndicator().hideAll();
                      if (state.dataState.isDone) {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return _buildDialog();
                          },
                        );
                      } else {
                        myShowSnackBar(context, state.message);
                      }
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_submit()) {
                        context.read<AuthenticationBloc>().add(
                          ChangePassword(
                            request: ChangePasswordRequest(
                              email: widget.email,
                              password: _confirmPasswordController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return BlurredDialog(
      child: AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _screenSize.height * 0.2,
              width: _screenSize.width,
              child: Lottie.asset(
                'assets/lottie/reset_password_animation.json',
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Password updated successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'Your password has been updated successfully!',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: _screenSize.width,
              height: _screenSize.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                  context.goNamed(Routes.mainRoute);
                },
                child: Text(
                  'Navigate to home',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _submit() {
    return _formKey.currentState!.validate();
  }

  final _formKey = GlobalKey<FormState>();
}
