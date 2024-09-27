import 'package:flutter/material.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/view/login/create_account.dart';
import 'package:frontend/view/onboarding/onboarding.dart';
import 'package:frontend/view/widget/bottom_appbar.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      builder: (controller) {
        controller.verifyUser();
        print(controller.state);
        if (controller.state.value == LoginState.onboarding) {
          return const OnboardingPage();
        }
        if (controller.state.value == LoginState.login) {
          return const CreateAccount();
        }
        return Scaffold(
          backgroundColor: GrayscaleWhiteColors.white,
          body: GetX<NavigationController>(
            builder: (controller) => controller
                .widgets[Get.find<NavigationController>().currentIndex.value],
          ),
          bottomNavigationBar: CustomBottomAppBar(),
        );
      },
    );
  }
}
