import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.controller,
    this.obsecureText = false,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
  });
  final String label;
  final TextEditingController? controller;
  final bool obsecureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool? readOnly;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? _obsecure;
  @override
  void initState() {
    super.initState();
    _obsecure = widget.obsecureText == true ? true : null;
  }

  void _toggleObsecure() {
    if (_obsecure != null) {
      setState(() {
        _obsecure = !_obsecure!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _obsecure ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.suffixIcon ??
            (_obsecure == null
                ? null
                : GestureDetector(
                  onTap: _toggleObsecure,
                  child: Icon(
                    _obsecure! ? Icons.visibility : Icons.visibility_off,
                  ),
                )),
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    );
  }
}
