import '../../../../../common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key, required this.onChanged});
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.15,
      child: TextFormField(
        onChanged: (value) {
          onChanged(value);
          FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (checkIfEmpty(value)) {
            return '';
          } else {
            return null;
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
