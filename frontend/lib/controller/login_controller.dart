import 'package:get/get.dart';
import 'package:hive/hive.dart';

enum LoginState { onboarding, login, home }

class LoginController extends GetxController {
  var isLoading = false.obs;
  final Box userDataBox = Hive.box("userData");
  Rx<LoginState> state = LoginState.onboarding.obs;
  LoginController() {
    verifyUser();
  }

  verifyUser() async {
    print("LoginController:  ${userDataBox.keys} ${userDataBox.values}");
    isLoading.value = true;
    if (userDataBox.containsKey("isLoggedIn") == false) {
      userDataBox.put("isFirstTime", true);
      userDataBox.put("isLoggedIn", false);
    } else {
      if (userDataBox.get("isLoggedIn") == false) {
        state.value = LoginState.login;
      } else {
        state.value = LoginState.home;
        return;
      }
    }
    if (userDataBox.containsKey("isFirstTime")) {
      state.value = LoginState.onboarding;
    } else if (userDataBox.get("isLoggedIn") == false) {
      state.value = LoginState.login;
    } else {
      state.value = LoginState.onboarding;
      isLoading.value = false;
    }
  }
}
