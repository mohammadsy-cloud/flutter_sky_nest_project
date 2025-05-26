import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.spacing,
    this.spacingTop,
    this.spacingBottom,
  });
  final double spacing;
  final double? spacingTop;
  final double? spacingBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacingTop ?? spacing),
        Divider(color: Colors.black, thickness: 0.1),
        SizedBox(height: spacingBottom ?? spacing),
      ],
    );
  }
}
