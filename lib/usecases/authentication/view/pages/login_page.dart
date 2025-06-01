import 'package:demo_project/common/navigation/routes.dart';

import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Enter Your information below',
                style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
              ),
              SizedBox(height: 100),
              CustomTextFormField(label: 'Email', controller: _emailController),
              SizedBox(height: 20),
              CustomTextFormField(
                obsecureText: true,
                label: 'Password',
                controller: _passwordController,
              ),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap:
                      () => Navigator.of(context).pushNamed('/forgotPassword'),
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.mainRoute);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.of(
                                    context,
                                  ).pushReplacementNamed('/register'),
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
    );
  }
}
