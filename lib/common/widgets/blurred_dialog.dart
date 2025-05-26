import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredDialog extends StatelessWidget {
  final Widget child;

  const BlurredDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),
        ),
        // Dialog content
        Center(child: child),
      ],
    );
  }
}
