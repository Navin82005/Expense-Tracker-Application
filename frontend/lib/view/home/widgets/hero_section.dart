import 'package:flutter/material.dart';
import 'package:frontend/controller/dashboard_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/home/widgets/secondary_container.dart';

class HeroSection extends StatelessWidget {
  final DashboardController dashboardController;
  const HeroSection({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          HeroFirstChild(dashboardController: dashboardController),
          const SizedBox(height: 16),
          HeroSecondChild(dashboardController: dashboardController),
        ],
      ),
    );
  }
}

class HeroFirstChild extends StatelessWidget {
  final DashboardController dashboardController;
  const HeroFirstChild({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: PrimaryColor.shade500,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Net Balance: ${dashboardController.walletCurrencyType}",
              style: CustomTypography.subHead3.copyWith(
                color: GrayscaleWhiteColors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp ${dashboardController.returnRate()}",
              style: CustomTypography.heading1.copyWith(
                color: GrayscaleWhiteColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroSecondChild extends StatelessWidget {
  final DashboardController dashboardController;
  const HeroSecondChild({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SecondaryContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Income", style: CustomTypography.body3),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_up,
                      color: PrimaryColor.shade600,
                      size: CustomTypography.subHead1.fontSize! * 1.5,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dashboardController.formatRate(
                        dashboardController.income,
                      ),
                      style: CustomTypography.subHead1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        SecondaryContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Expenses", style: CustomTypography.body3),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: DangerColors.shade600,
                      size: CustomTypography.subHead1.fontSize,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dashboardController.formatRate(
                        dashboardController.expenses,
                      ),
                      style: CustomTypography.subHead1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
