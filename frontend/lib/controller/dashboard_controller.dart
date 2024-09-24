import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  String walletCurrencyType = "INR";
  double balance = 5436788;
  double income = 8501001;
  double expenses = 3064213;

  String formatRate(double rate) {
    final formattedRate = NumberFormat("###,###,###").format(rate);
    return formattedRate;
  }

  String returnRate() {
    final formattedRate = NumberFormat("###,###,###").format(balance);
    return formattedRate;
  }
}
