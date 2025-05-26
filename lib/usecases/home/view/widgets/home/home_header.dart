// ignore_for_file: non_constant_identifier_names

import 'package:demo_project/common/widgets/clipping_widget.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends ClippingWidget {
  HomeHeaderWidget({
    super.key,
    required super.child,
    required super.size,
    super.backgroundColor,
  }) : super(clipper: HomeHeaderClipper());
}

class HomeHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.0010143, size.height * 0.0057333);
    path.lineTo(size.width * 0.0003286, size.height * 0.6557333);
    path.quadraticBezierTo(
      size.width * 0.1384571,
      size.height * 0.8092000,
      size.width * 0.5000000,
      size.height * 0.8300000,
    );
    path.quadraticBezierTo(
      size.width * 0.8658143,
      size.height * 0.8076333,
      size.width * 1.0001143,
      size.height * 0.6536333,
    );
    path.lineTo(size.width * 0.9985429, size.height * -0.0066667);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
