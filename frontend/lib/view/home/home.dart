import 'package:flutter/material.dart';
import 'package:frontend/controller/dashboard_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/view/home/widgets/appbar_actions.dart';
import 'package:frontend/view/home/widgets/hero_section.dart';
import 'package:frontend/view/home/widgets/transaction_section.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayscaleWhiteColors.white,
      appBar: PreferredSize(
        preferredSize: Size.copy(const Size(double.infinity, 68)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarHeader(),
                AppBarActions(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          HeroSection(dashboardController: dashboardController),
          const SizedBox(height: 12),
          const TransactionSection(),
        ],
      ),
    );
  }
}
