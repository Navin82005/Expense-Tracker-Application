import 'package:frontend/view/budget/budget.dart';
import 'package:frontend/view/home/home.dart';
import 'package:frontend/view/settings/settings.dart';
import 'package:frontend/view/transaction/transaction.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var widgets = [
    const Home(),
    Transaction(),
    const Budget(),
    const Settings(),
  ];
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
