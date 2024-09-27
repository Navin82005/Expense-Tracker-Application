import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/home/widgets/secondary_container.dart';

class Income extends StatelessWidget {
  final double amount;
  const Income({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return SecondaryContainer(
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
