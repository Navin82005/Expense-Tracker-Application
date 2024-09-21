import "package:get/get.dart";

class OnboardingPageController extends GetxController {
  var pageNumber = 0.obs;
  int totalPages = 0;

  set setTotalPages(int pages) => totalPages = pages;

  resetPage() {
    pageNumber.value = 0;
  }

  next() {
    if (pageNumber < totalPages) {
      pageNumber.value += 1;
    } else {
      pageNumber.value = totalPages;
    }
  }
}
