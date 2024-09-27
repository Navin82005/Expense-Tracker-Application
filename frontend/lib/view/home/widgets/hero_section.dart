import 'package:flutter/material.dart';
import 'package:frontend/controller/dashboard_controller.dart';
import 'package:frontend/controller/global_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/widget/expense.dart';
import 'package:frontend/view/widget/income.dart';
import 'package:get/get.dart';

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
              "${Get.find<GlobalController>().currencySymbol} ${dashboardController.returnRate()}",
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
        Income(amount: dashboardController.income),
        const SizedBox(width: 12),
        Expense(amount: dashboardController.expenses)
      ],
    );
  }
}
