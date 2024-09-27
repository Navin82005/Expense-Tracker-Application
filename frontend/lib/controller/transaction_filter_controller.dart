import 'package:frontend/model/transaction_model.dart';
import 'package:get/get.dart';

enum Filters { daily, weekly, monthly, yearly }

Map<Filters, List<Map<String, dynamic>>> filtersValues = {
  Filters.daily: [
    {"value": "mon", "isSelected": true},
    {"value": "tue", "isSelected": false},
    {"value": "wed", "isSelected": false},
    {"value": "thu", "isSelected": false},
    {"value": "fri", "isSelected": false},
    {"value": "sat", "isSelected": false},
    {"value": "sun", "isSelected": false},
  ],
  Filters.weekly: [
    {"value": "1st", "isSelected": true},
    {"value": "2nd", "isSelected": false},
    {"value": "3rd", "isSelected": false},
    {"value": "4th", "isSelected": false},
  ],
  Filters.monthly: [
    {"value": "jan", "isSelected": true},
    {"value": "feb", "isSelected": false},
    {"value": "mar", "isSelected": false},
    {"value": "apr", "isSelected": false},
    {"value": "may", "isSelected": false},
    {"value": "jun", "isSelected": false},
    {"value": "jul", "isSelected": false},
    {"value": "aug", "isSelected": false},
    {"value": "sep", "isSelected": false},
    {"value": "oct", "isSelected": false},
    {"value": "nov", "isSelected": false},
    {"value": "dec", "isSelected": false},
  ],
  Filters.yearly: [
    {"value": "2024", "isSelected": true}
  ],
};

class TransactionFilterController extends GetxController {
  var isLoading = false.obs;
  var currentFilter = Filters.daily.obs;
  var currentFilterValue = "${filtersValues[Filters.daily]![0]["value"]}".obs;
  var netIncome = 0.0.obs;
  var netExpense = 0.0.obs;
  var transactions = [].obs;

  RxList<Map<String, dynamic>> selectedFilterValues =
      filtersValues[Filters.daily]!.sublist(0, DateTime.now().weekday + 1).obs;

  void changeFilter(Filters filter) {
    currentFilter.value = filter;
    if (filter == Filters.monthly) {
      selectedFilterValues.value =
          filtersValues[filter]!.sublist(0, DateTime.now().month + 1);
    } else if (filter == Filters.weekly) {
      selectedFilterValues.value = filtersValues[filter]!
          .sublist(0, DateTime.now().day ~/ DateTime.now().day + 1);
    } else if (filter == Filters.yearly) {
      selectedFilterValues.value = filtersValues[filter]!.sublist(0);
    } else if (filter == Filters.daily) {
      selectedFilterValues.value =
          filtersValues[filter]!.sublist(0, DateTime.now().weekday + 1);
    }
  }

  void changeSelectedFilterValues(int index) {
    List<Map<String, dynamic>> tmp = [];

    for (int i = 0; i < selectedFilterValues.length; i++) {
      if (i == index) {
        tmp += [
          {"value": selectedFilterValues[i]["value"], "isSelected": true}
        ];
      } else {
        tmp += [
          {"value": selectedFilterValues[i]["value"], "isSelected": false}
        ];
      }
    }

    selectedFilterValues.value = tmp;
    fetchTransactionsWithFilter();
    update();
  }

  fetchTransactionsWithFilter() async {
    isLoading.value = true;
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

    netIncome.value = 0;
    netExpense.value = 0;
    for (TransactionModel i in transactions) {
      if (i.status == TransactionStatus.income) {
        netIncome.value += i.amount;
      } else if (i.status == TransactionStatus.expense) {
        netExpense.value += i.amount;
      }
    }
    isLoading.value = false;
  }
}
