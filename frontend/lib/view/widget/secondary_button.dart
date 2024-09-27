import 'package:flutter/material.dart';
import 'package:frontend/core/style/color.dart';

class SecondaryIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  const SecondaryIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.height = 44,
    this.width = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
        onPressed: onTap,
        child: icon,
      ),
    );
  }
}
