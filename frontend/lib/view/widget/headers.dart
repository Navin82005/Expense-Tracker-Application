import 'package:flutter/material.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/widget/secondary_button.dart';

class HeaderActions extends StatelessWidget {
  final Icon icon1;
  final Icon icon2;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  const HeaderActions({
    super.key,
    required this.icon1,
    this.onTap1,
    required this.icon2,
    this.onTap2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SecondaryIconButton(
          icon: icon1,
        ),
        const SizedBox(width: 8),
        SecondaryIconButton(
          icon: icon2,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: CustomTypography.heading6),
      ],
    );
  }
}
