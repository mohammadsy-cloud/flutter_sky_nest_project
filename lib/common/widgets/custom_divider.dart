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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: spacingTop ?? spacing),
          Divider(height: 2),
          SizedBox(height: spacingBottom ?? spacing),
        ],
      ),
    );
  }
}
