import 'package:flutter/widgets.dart';
import 'package:frontend/core/config/app_config.dart';
import 'package:frontend/core/style/typography.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          const SafeArea(child: SizedBox.shrink()),
          Image.asset(AppConfig.appIcon),
          Text(
            "Create New Wallet",
            style: CustomTypography.heading4,
          ),
        ],
      ),
    );
  }
}
