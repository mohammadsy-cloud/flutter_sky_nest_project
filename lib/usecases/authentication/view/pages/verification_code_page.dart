import 'package:demo_project/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:demo_project/common/navigation/routes.dart' show Routes;
import 'package:demo_project/common/widgets/blurred_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/theme/color_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/otp_widget.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key, required this.email, this.code});
  final String email;
  final int? code;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final Size _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.sizeOf(context);
  }

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
          top: _screenSize.height * 0.03,
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
              width: _screenSize.width,
              height: _screenSize.height * 0.35,
              child: Image.asset(
                filterQuality: FilterQuality.high,
                'assets/images/otp_image.png',
                // color: Theme.of(context).colorScheme.primary,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: _screenSize.height * 0.1),
            SizedBox(
              width: _screenSize.width,
              height: _screenSize.height * 0.08,
              child: BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state.token != null) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return _buildDialog();
                      },
                    );
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    if (validateFormKey(_formKey)) {
                      context.read<AuthenticationBloc>().add(
                        VerifyOTP(otp: '$d1$d2$d3$d4'),
                      );
                    }
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
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
              height: _screenSize.height * 0.16,
              width: _screenSize.width,
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
              width: _screenSize.width * 0.5,
              height: _screenSize.height * 0.06,
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
