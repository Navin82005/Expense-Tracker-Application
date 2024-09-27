import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_filter_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/widget/transaction_tile.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionListView extends StatelessWidget {
  final bool? isScrollable;
  const TransactionListView({super.key, this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionFilterController>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            // physics: isScrollable == false
            //     ? const NeverScrollableScrollPhysics()
            //     : const BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1 + controller.transactions.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return listSubHeader();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TransactionTile(
                  tileData: controller.transactions[index - 1],
                ),
              );
            },
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    );
  }

  Widget listSubHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Transaction List", style: CustomTypography.body2),
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
