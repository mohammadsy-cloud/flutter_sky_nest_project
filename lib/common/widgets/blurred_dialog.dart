import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlurredDialog extends StatelessWidget {
  final Widget child;
  final bool barrierDismissible;

  const BlurredDialog({
    super.key,
    required this.child,
    this.barrierDismissible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap:
                barrierDismissible
                    ? () {
                      context.pop();
                    }
                    : null,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withValues(alpha: 0.3)),
            ),
          ),
        ),

        // Dialog content
        Center(child: child),
      ],
    );
  }
}
