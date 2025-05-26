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
          top: screenHeight(context) * 0.03,
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
                width: screenWidth(context),
                height: screenHeight(context) * 0.35,
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
              SizedBox(height: screenHeight(context) * 0.1),
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    if (_submit()) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return _buildDialog();
                        },
                      );
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
              height: screenHeight(context) * 0.2,
              width: screenWidth(context),
              child: Image.asset(
                'assets/images/password_updated_successfully.png',
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
              width: screenWidth(context),
              height: screenHeight(context) * 0.07,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil('/login', (_) => false),
                child: Text(
                  'Back to home',
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
