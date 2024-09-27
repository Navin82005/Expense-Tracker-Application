import 'package:flutter/material.dart';
import 'package:frontend/controller/wallet_creation_controller.dart';
import 'package:frontend/layout.dart';
import 'package:get/get.dart';

import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/login/login_account.dart';
import 'package:frontend/view/widget/primary_button.dart';

class CustomLoginFooter extends StatelessWidget {
  const CustomLoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: CustomTypography.subHead2,
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => Get.to(() => const LoginAccount()),
              child: Text(
                "Login",
                style: CustomTypography.subHead2.copyWith(
                  color: const Color(0xFF258C40),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        PrimaryButton(
          onPressed: () async {
            var controller = Get.find<WalletCreationController>();
            print(controller.data());
            if (await controller.createWallet()) {
              Get.off(() => const Layout());
            }
          },
          text: "Create new wallet",
        ),
      ],
    );
  }
}
