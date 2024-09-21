import 'package:flutter/material.dart';
import 'package:frontend/core/style/typography.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: const ButtonStyle().copyWith(
          backgroundColor: const WidgetStatePropertyAll(Color(0xFF4BC355)),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            style: CustomTypography.heading8.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
