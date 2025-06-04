import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart' show Routes;
import 'package:sky_nest/common/repos/requests/verify_otp_request.dart';
import 'package:sky_nest/common/widgets/blurred_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/theme/color_pallete.dart';
import 'reset_password_page.dart';
import 'package:flutter/material.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/otp_widget.dart';

class VerificationCodeChangePage extends StatefulWidget {
  const VerificationCodeChangePage({super.key, required this.email, this.code});
  final String email;
  final int? code;

  @override
  State<VerificationCodeChangePage> createState() =>
      _VerificationCodeChangePageState();
}

class _VerificationCodeChangePageState
    extends State<VerificationCodeChangePage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int? d1, d2, d3, d4;
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
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPWidget(
                    onChanged: (value) {
                      d1 = int.parse(value);
                    },
                  ),
                  OTPWidget(
                    onChanged: (value) {
                      d2 = int.parse(value);
                    },
                  ),
                  OTPWidget(
                    onChanged: (value) {
                      d3 = int.parse(value);
                    },
                  ),
                  OTPWidget(
                    onChanged: (value) {
                      d4 = int.parse(value);
                    },
                  ),
                ],
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
                    ChangePasswordVerify(
                      request: VerifyOtpRequest(
                        email: widget.email,
                        code: '$d1$d2$d3$d4',
                      ),
                    ),
                  );
                  await for (final newState
                      in context.read<AuthenticationBloc>().stream) {
                    if (newState.dataState.isDone) {
                      context.goNamed(
                        Routes.resetPasswordRoute,
                        pathParameters: {'email': widget.email},
                      );
                    }
                  }
                }
              },
              child: Text('Verify', style: TextStyle(fontSize: 18)),
            ),
          ],
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
              height: screenHeight(context) * 0.16,
              width: screenWidth(context),
              child: Lottie.asset('assets/lottie/successfully_animation.json'),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Email verified successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: screenWidth(context) * 0.5,
              height: screenHeight(context) * 0.06,
              child: ElevatedButton(
                onPressed: () => context.goNamed(Routes.mainRoute),
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
}
