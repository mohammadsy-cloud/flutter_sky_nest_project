import 'package:flutter/material.dart';

class DelayedDisplay extends StatelessWidget {
  const DelayedDisplay({super.key, required this.child, required this.delay});
  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center();
        }
        return child;
      },
    );
  }
}
