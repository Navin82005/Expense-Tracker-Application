import 'package:get/get.dart';

class GlobalController extends GetxController {
  final currencySymbol = "".obs;

  void updateCurrencySymbol(String symbol) {
    currencySymbol.value = symbol;
  }
}
