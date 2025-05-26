import '../../../../common/theme/color_pallete.dart';
import 'reset_password_page.dart';
import 'package:flutter/material.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/otp_widget.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key, required this.email});
  final String email;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter OTP code',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'OTP code has been sent to ${widget.email}',
              style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OTPWidget(onChanged: (value) {}),
                OTPWidget(onChanged: (value) {}),
                OTPWidget(onChanged: (value) {}),
                OTPWidget(onChanged: (value) {}),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                child: Text(
                  'Resend code',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.35,
              child: Image.asset(
                filterQuality: FilterQuality.high,
                'assets/images/otp_image.png',
                // color: Theme.of(context).colorScheme.primary,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight(context) * 0.1),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  // TODO send verify request
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) =>
                              ResetPasswordPage(email: _emailController.text),
                    ),
                  );
                },
                child: Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
