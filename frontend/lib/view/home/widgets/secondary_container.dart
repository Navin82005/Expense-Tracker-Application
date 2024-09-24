import 'package:flutter/material.dart';
import 'package:frontend/core/style/color.dart';

class SecondaryContainer extends StatelessWidget {
  final Widget child;
  const SecondaryContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: GrayscaleWhiteColors.shadedWhite),
          color: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
