import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletCreationController extends GetxController {
  TextEditingController walletTextEditingController = TextEditingController();
  TextEditingController balanceTextEditingController = TextEditingController();
  var walletName = "".obs;
  var selectedCurrencyType = "".obs;
  var walletBalance = 0.obs;
  var loading = false.obs;

  var isValidName = true.obs;
  var isValidBalance = true.obs;
  var isValidCurrency = true.obs;

  void setCurrencyType(String type) {
    selectedCurrencyType.value = type;
  }

  List<Map<String, String>> data() {
    if (isValid()) {
      walletBalance.value = int.parse(balanceTextEditingController.text);
      walletName.value = walletTextEditingController.text;
      return [
        {
          "name": walletName.value.toString(),
          "currencyType": selectedCurrencyType.value.toString(),
          "balance": walletBalance.value.toString(),
        }
      ];
    }
    return [];
  }

  bool isValid() {
    print(
        "${balanceTextEditingController.text} : ${walletTextEditingController.text} : ${selectedCurrencyType.value}");
    if (walletTextEditingController.text == "") {
      isValidName.value = false;
      return false;
    } else {
      isValidName.value = true;
    }

    if (balanceTextEditingController.text == "") {
      isValidBalance.value = false;
      return false;
    } else {
      isValidBalance.value = true;
    }

    if (selectedCurrencyType.value == "") {
      isValidCurrency.value = false;
      return false;
    } else {
      isValidCurrency.value = true;
    }

    return true;
  }

  bool isValidData() {
    if (walletBalance.value.toString() == "" ||
        walletName.value.toString() == "" ||
        selectedCurrencyType.value == "") return false;
    return true;
  }

  Future<bool> createWallet() async {
    loading.value = true;
    if (isValidData()) {
      await Future.delayed(const Duration(seconds: 2));
      loading.value = false;
      return true;
    }
    loading.value = false;
    return false;
  }
}
