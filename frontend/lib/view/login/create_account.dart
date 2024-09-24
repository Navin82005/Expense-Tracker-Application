import 'package:flutter/material.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:get/get.dart';

import 'package:frontend/view/login/widgets/custom_login_footer.dart';
import 'package:frontend/view/login/widgets/custom_login_header.dart';
import 'package:frontend/view/login/widgets/custom_text_field.dart';
import 'package:frontend/view/login/widgets/select_currency.dart';

import 'package:frontend/core/style/color.dart';
import 'package:frontend/controller/wallet_creation_controller.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var walletCreationController = Get.put(WalletCreationController());
  FocusNode nameFocus = FocusNode();
  FocusNode currencyFocus = FocusNode();
  FocusNode balanceFocus = FocusNode();

  @override
  void dispose() {
    nameFocus.dispose();
    currencyFocus.dispose();
    balanceFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomLoginHeader(), // Logo image and a Heading
                // Wallet Name
                CustomTextField(
                  textEditingController:
                      walletCreationController.walletTextEditingController,
                  focus: nameFocus,
                  heading: "Wallet Name",
                  placeholder: "Enter new wallet name",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),

                const SelectCurrency(), // Currency Section
                const SizedBox(height: 16),

                // Wallet Balance
                CustomTextField(
                  focus: balanceFocus,
                  textEditingController:
                      walletCreationController.balanceTextEditingController,
                  heading: "Wallet Balance",
                  placeholder: "Enter wallet balance",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                GetX<WalletCreationController>(
                  builder: (controller) {
                    if (!controller.isValidName.value) {
                      nameFocus.requestFocus();
                      return Text(
                        "Enter valid a name for wallet",
                        style: CustomTypography.subHead2.copyWith(
                          color: DangerColors.shade500,
                        ),
                      );
                    }
                    if (!controller.isValidCurrency.value) {
                      return Text(
                        "Select currency type",
                        style: CustomTypography.subHead2.copyWith(
                          color: DangerColors.shade500,
                        ),
                      );
                    }
                    if (!controller.isValidBalance.value) {
                      balanceFocus.requestFocus();
                      return Text(
                        "Enter valid valid balance amount",
                        style: CustomTypography.subHead2.copyWith(
                          color: DangerColors.shade500,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const Spacer(),
                const CustomLoginFooter(), // Login button and Create button
              ],
            ),
            GetX<WalletCreationController>(
              builder: (controller) {
                // print(w);
                if (controller.loading.value) {
                  return Positioned.fill(
                    top: 0,
                    child: Container(
                      width: double.infinity,
                      color: GrayscaleGrayColors.paleGray,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
