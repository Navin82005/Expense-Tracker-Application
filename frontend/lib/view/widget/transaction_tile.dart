import 'package:flutter/material.dart';
import 'package:frontend/controller/global_controller.dart';
import 'package:frontend/controller/transaction_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/model/transaction_model.dart';
import 'package:get/get.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel tileData;
  final Widget? leading;
  final Widget? subtitle;
  const TransactionTile({
    super.key,
    required this.tileData,
    this.leading,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: GrayscaleGrayColors.lightGray,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 80,
            decoration: BoxDecoration(
              color: tileData.status == TransactionStatus.income
                  ? PrimaryColor.shade500
                  : DangerColors.shade500,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                tileData.category.name.capitalizeFirst!,
                style: CustomTypography.body4.copyWith(
                  color: GrayscaleGrayColors.lightGray,
                ),
              ),
              leading: leading,
              subtitle: subtitle ??
                  Text(
                    tileData.name,
                    style: CustomTypography.subHead1,
                  ),
              trailing: Text(
                "${tileData.status == TransactionStatus.income ? "+${Get.find<GlobalController>().currencySymbol}" : "-${Get.find<GlobalController>().currencySymbol}"} ${TransactionController.formatRate(tileData.amount)}",
                style: CustomTypography.subHead3.copyWith(
                  color: tileData.status == TransactionStatus.income
                      ? PrimaryColor.shade500
                      : DangerColors.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
