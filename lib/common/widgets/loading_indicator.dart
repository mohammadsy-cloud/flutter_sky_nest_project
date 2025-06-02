import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicator {
  static final LoadingIndicator _instance = LoadingIndicator._internal();
  factory LoadingIndicator() => _instance;
  LoadingIndicator._internal();

  OverlayEntry? _overlayEntry;
  VoidCallback? _onDismissCallback;
  int _showCounter = 0;

  void show(
    BuildContext context, {
    String lottieAsset = 'assets/lottie/loading_animation.json',
    bool dismissOnTap = true,
    VoidCallback? onDismiss,
  }) {
    _showCounter++;
    if (_overlayEntry != null) return;

    _onDismissCallback = onDismiss;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Material(
            color: Colors.black.withValues(alpha: 0.15),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: dismissOnTap ? _dismissOverlay : null,
              child: Center(
                child: Lottie.asset(
                  lottieAsset,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _dismissOverlay() {
    hide();
    _onDismissCallback?.call();
  }

  void hide() {
    if (_showCounter <= 0) return;
    _showCounter--;

    if (_showCounter == 0) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _onDismissCallback = null;
    }
  }

  void hideAll() {
    _showCounter = 0;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _onDismissCallback?.call();
    _onDismissCallback = null;
  }
}
