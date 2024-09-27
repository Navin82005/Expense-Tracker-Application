import 'package:get/get.dart';
import 'package:frontend/model/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  var transactions = [].obs;
  var isLoading = false.obs;

  fetchTransactions() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    transactions.value = [
      TransactionModel(
        name: "Stock Divided",
        amount: 402500,
        status: TransactionStatus.income,
        category: TransactionCategory.investment,
        type: TransactionType.manual,
        dateTime: DateTime.now(),
        note: "Divided from AAPL stock",
      ),
      TransactionModel(
        name: "A Piece of Burger",
        amount: 35000,
        status: TransactionStatus.expense,
        category: TransactionCategory.food,
        type: TransactionType.manual,
        dateTime: DateTime.now(),
        note: "A little snack in weekend",
      ),
      TransactionModel(
        name: "Oil Change",
        amount: 54000,
        status: TransactionStatus.expense,
        category: TransactionCategory.vehicle,
        type: TransactionType.manual,
        dateTime: DateTime.now(),
        note: "Changed oil for R15",
      ),
    ];
    isLoading.value = false;
  }

  static String formatRate(double rate) {
    final formattedRate = NumberFormat("###,###,###").format(rate);
    return formattedRate;
  }
}
