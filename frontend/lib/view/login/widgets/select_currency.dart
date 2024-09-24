import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:frontend/core/config/app_data.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';

import 'package:frontend/controller/wallet_creation_controller.dart';

class SelectCurrency extends StatelessWidget {
  const SelectCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Currency",
          style: CustomTypography.subHead3.copyWith(
            color: GrayscaleBlackColors.lightBlack,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: GrayscaleWhiteColors.darkWhite,
            ),
          ),
          child: GetX<WalletCreationController>(
            builder: (WalletCreationController controller) =>
                DropdownButton<String>(
              elevation: 0,
              borderRadius: null,
              isExpanded: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),

              //
              style: CustomTypography.subHead3,
              hint: Text(
                "Select Currency",
                style: CustomTypography.subHead3.copyWith(
                  color: GrayscaleGrayColors.paleGray,
                ),
              ),
              value: controller.selectedCurrencyType.value.isNotEmpty
                  ? controller.selectedCurrencyType.value
                  : null,
              underline: const SizedBox.shrink(),

              //
              items: AppData.currencyList.map((currency) {
                return DropdownMenuItem(
                  value: currency['currency'].toString(),
                  child: Text(
                    '${currency['name']} ${currency['flag']}',
                    style: CustomTypography.subHead3.copyWith(
                      color: GrayscaleBlackColors.lightBlack,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (currency) => controller.setCurrencyType(
                currency.toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
