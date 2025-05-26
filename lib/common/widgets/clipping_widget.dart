// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class ClippingWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Size size;
  final CustomClipper<Path> clipper;

  const ClippingWidget({
    super.key,
    required this.child,
    this.backgroundColor,
    required this.size,
    required this.clipper,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ClipPath(
        clipper: clipper,
        child: Container(
          color: backgroundColor, // Optional background color
          child: child,
        ),
      ),
    );
  }
}
