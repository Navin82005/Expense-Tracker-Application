import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({super.key});

  final NavigationController navigationController =
      Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: GrayscaleWhiteColors.darkWhite,
          ),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: navigationController.updateIndex,
          elevation: 0,
          iconSize: 24,
          backgroundColor: GrayscaleWhiteColors.white,
          unselectedItemColor: GrayscaleGrayColors.lightGray,
          selectedItemColor: PrimaryColor.shade500,
          selectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home,
              ),
            ),
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(
                CupertinoIcons.square_list_fill,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: PrimaryColor.shade500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, color: GrayscaleBlackColors.black),
              ),
            ),
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.account_balance,
              ),
            ),
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
