import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';
import 'package:demo_project/common/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _locationController = TextEditingController();
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _locationController.dispose();
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
              SizedBox(height: 20),
              Text(
                'Register Now!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Enter Your information below',
                style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                label: 'Full Name',
                controller: _fullNameController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(label: 'Email', controller: _emailController),
              SizedBox(height: 20),
              CustomTextFormField(
                obsecureText: true,
                label: 'Password',
                controller: _passwordController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                label: 'Location',
                controller: _locationController,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Already a member? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.of(
                                    context,
                                  ).pushReplacementNamed('/login'),
                        text: 'Login',
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
