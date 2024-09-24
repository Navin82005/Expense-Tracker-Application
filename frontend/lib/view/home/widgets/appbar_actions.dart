import 'package:flutter/material.dart';
import 'package:frontend/core/config/app_config.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/widget/secondary_button.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SecondaryIconButton(
          icon: Icon(Icons.search, size: 20),
        ),
        SizedBox(width: 8),
        SecondaryIconButton(
          icon: Icon(Icons.notifications, size: 20),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppConfig.appIcon, height: 44, width: 44),
        const SizedBox(width: 12),
        Text(AppConfig.appName, style: CustomTypography.heading6),
      ],
    );
  }
}
