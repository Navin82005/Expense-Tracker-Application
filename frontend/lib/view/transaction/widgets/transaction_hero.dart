import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_filter_controller.dart';
import 'package:frontend/view/widget/expense.dart';
import 'package:frontend/view/widget/income.dart';
import 'package:get/get.dart';

class TransactionHero extends StatelessWidget {
  const TransactionHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Row(
          children: [
            Income(
                amount:
                    Get.find<TransactionFilterController>().netIncome.value),
            const SizedBox(width: 12),
            Expense(
                amount:
                    Get.find<TransactionFilterController>().netExpense.value),
          ],
        ),
      ),
    );
  }
}
