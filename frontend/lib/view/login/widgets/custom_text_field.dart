import 'package:flutter/material.dart';
import 'package:frontend/core/style/typography.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String heading;
  final String placeholder;
  final TextInputType keyboardType;
  final FocusNode focus;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.heading,
    required this.placeholder,
    required this.keyboardType,
    required this.focus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: CustomTypography.subHead3.copyWith(
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textEditingController,
          focusNode: focus,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: CustomTypography.subHead3.copyWith(
              color: const Color(0xFFAAAAAA),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
