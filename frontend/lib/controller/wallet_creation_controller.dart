import 'package:flutter/material.dart';
import 'package:frontend/controller/global_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/core/config/app_data.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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

  final Box userWalletBox = Hive.box("wallet");

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
      var loginController = Get.find<LoginController>();
      loginController.userDataBox.put("isLoggedIn", true);
      userWalletBox.put("name", walletName.value);
      userWalletBox.put("ballance", walletBalance.value);
      userWalletBox.put("currencyType", selectedCurrencyType.value);
      String symbol = AppData.getCurrencySymbol(selectedCurrencyType.value);
      Get.find<GlobalController>().updateCurrencySymbol(symbol);
      userWalletBox.put("currencySymbol", symbol);
      loading.value = false;
      loginController.state.value = LoginState.home;
      return true;
    }
    loading.value = false;
    return false;
  }
}
