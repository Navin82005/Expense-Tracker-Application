import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/home/widgets/secondary_container.dart';

class Expense extends StatelessWidget {
  final double amount;
  const Expense({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return SecondaryContainer(
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
                  TransactionController.formatRate(amount),
                  style: CustomTypography.subHead1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
