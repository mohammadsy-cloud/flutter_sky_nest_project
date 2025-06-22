import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/repos/authentication/requests/change_password_email_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/routes.dart';
import '../../../../common/theme/color_pallete.dart';
import 'verification_code_page.dart';
import '../../../../common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../common/utilities/app_utilities.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
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
          top: screenHeight(context) * 0.03,
          bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Enter which Email Address should we use to reset your password',
                style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.4,
                child: Image.asset(
                  filterQuality: FilterQuality.high,
                  'assets/images/forgot_password.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                textInputAction: TextInputAction.done,
                label: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (!isValidEmail(value)) {
                    return 'Please Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                  fixedSize: Size(
                    screenWidth(context),
                    screenHeight(context) * 0.08,
                  ),
                ),
                onPressed: () async {
                  if (validateFormKey(_formKey)) {
                    context.read<AuthenticationBloc>().add(
                      ChangePasswordEmail(
                        request: ChangePasswordEmailRequest(
                          email: _emailController.text,
                        ),
                      ),
                    );
                    await for (final newState
                        in context.read<AuthenticationBloc>().stream) {
                      if (newState.dataState.isDone) {
                        context.pushNamed(
                          Routes.verificationCodeChangeRoute,
                          pathParameters: {
                            'email': _emailController.text,
                            'code': '1',
                          },
                        );
                        break;
                      }
                    }
                  }
                },
                child: Text('Continue', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
}
