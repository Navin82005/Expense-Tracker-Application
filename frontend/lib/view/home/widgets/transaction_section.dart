import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/model/transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({super.key});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void initState() {
    super.initState();
    transactionController.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: GrayscaleWhiteColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: GrayscaleGrayColors.silver.withOpacity(.5),
              blurRadius: 10,
              offset: const Offset(0, -1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: GetX<TransactionController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listHeader(),
                    listSubHeader(),
                    const Spacer(),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const Spacer(),
                    const Spacer(),
                  ],
                );
              }
              if (controller.transactions.isNotEmpty) {
                return ListView.builder(
                  itemCount: 2 + controller.transactions.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return listHeader();
                    }
                    if (index == 1) {
                      return listSubHeader();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: TransactionTile(
                        tileData: controller.transactions[index - 2],
                      ),
                    );
                  },
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  listHeader(),
                  listSubHeader(),
                  const Spacer(),
                  Center(
                    child: Icon(
                      Icons.access_time_filled,
                      color: GrayscaleGrayColors.lightGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      "No Transactions made today",
                      style: CustomTypography.subHead2.copyWith(
                        color: GrayscaleGrayColors.lightGray,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget listHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Transaction", style: CustomTypography.heading6),
          TextButton(
            child: Text(
              "See More",
              style: CustomTypography.subHead3.copyWith(
                color: PrimaryColor.shade700,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget listSubHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today", style: CustomTypography.body2),
          Text(
            DateFormat("dd MMMM yyyy").format(DateTime.now()),
            style: CustomTypography.body3.copyWith(
              color: GrayscaleGrayColors.tintedGray,
            ),
          )
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final TransactionModel tileData;
  const TransactionTile({super.key, required this.tileData});

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
              subtitle: Text(
                tileData.name,
                style: CustomTypography.subHead1,
              ),
              trailing: Text(
                "${tileData.status == TransactionStatus.income ? "+Rp" : "-Rp"} ${Get.find<TransactionController>().formatRate(tileData.amount)}",
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
