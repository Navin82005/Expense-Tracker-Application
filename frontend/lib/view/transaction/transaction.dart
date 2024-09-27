import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_filter_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/view/transaction/widgets/filter_section.dart';
import 'package:frontend/view/transaction/widgets/pie_chart.dart';
import 'package:frontend/view/transaction/widgets/transaction_header.dart';
import 'package:frontend/view/transaction/widgets/transaction_hero.dart';
import 'package:frontend/view/widget/transaction_list_view.dart';
import 'package:get/get.dart';

class Transaction extends StatelessWidget {
  Transaction({super.key});
  final TransactionFilterController transactionFilterController =
      Get.put(TransactionFilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayscaleWhiteColors.white,
      appBar: TransactionHeader(),
      body: Column(
        children: [
          const FilterSection(),
          const TransactionHero(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                TransactionListView(isScrollable: false),
                PieChartWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
