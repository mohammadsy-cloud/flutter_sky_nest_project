import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/repos/requests/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/loading_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: screenHeight(context) * 0.08,
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(-30.0, 0.0),
                  child: Image.asset(
                    color: Theme.of(context).colorScheme.primary,
                    'assets/images/app_logo_skynest.png',
                    width: screenWidth(context) * 0.7,
                    height: screenHeight(context) * 0.08,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                SizedBox(height: screenHeight(context) * 0.04),

                Text(
                  'Let\'s get you Login!',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter Your information below',
                  style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
                ),
                SizedBox(height: 100),
                CustomTextFormField(
                  validator: (value) {
                    if (!isValidEmail(value)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  label: 'Email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (checkIfEmpty(value)) {
                      return 'Enter a valid password';
                    } else {
                      return null;
                    }
                  },
                  obsecureText: true,
                  label: 'Password',
                  controller: _passwordController,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.forgotPasswordRoute),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: screenWidth(context),
                  height: screenHeight(context) * 0.08,
                  child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listenWhen:
                        (previous, current) => !current.dataState.isEmpty,
                    listener: (context, state) {
                      if (state.dataState.isLoading) {
                        LoadingIndicator().show(context);
                      } else {
                        LoadingIndicator().hideAll();

                        myShowSnackBar(context, state.message);
                        if (state.dataState.isData) {
                          context.pushNamed(
                            Routes.verificationCodeRoute,
                            pathParameters: {
                              "code": "1",
                              "email": _emailController.text,
                            },
                          );
                        }
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (validateFormKey(_formKey)) {
                            context.read<AuthenticationBloc>().add(
                              AuthLogIn(
                                request: LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(fontSize: 15),

                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  context.goNamed(Routes.registerRoute);
                                },
                          text: 'Register',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
