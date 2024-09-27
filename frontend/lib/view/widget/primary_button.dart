import 'package:flutter/material.dart';
import 'package:frontend/core/style/typography.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height != null ? height! + 10 : null,
      child: TextButton(
        style: const ButtonStyle().copyWith(
          backgroundColor: const WidgetStatePropertyAll(Color(0xFF4BC355)),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: child ??
              Text(
                text!,
                style: CustomTypography.heading8.copyWith(color: Colors.white),
              ),
        ),
      ),
    );
  }
}
