import 'package:flutter/material.dart';
import 'package:frontend/core/style/color.dart';

class SecondaryIconButton extends StatelessWidget {
  final Widget icon;
  const SecondaryIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: GrayscaleWhiteColors.darkWhite),
      ),
      child: TextButton(
        style: const ButtonStyle().copyWith(
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.all(0),
          ),
        ),
        onPressed: () {},
        child: icon,
      ),
    );
  }
}
