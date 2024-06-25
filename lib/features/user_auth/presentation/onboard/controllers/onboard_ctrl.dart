import 'package:demo_webs/features/user_auth/presentation/pages/login_page.dart';
import '../../../../../app.dart';

class OnboardCtrl extends GetxController {
  static OnboardCtrl get instance => Get.find();

  final pageController = PageController();
  int currentPageIndex = 0;

  // void updatePageIndicator(index) {
  //   currentPageIndex = index;
  // }

  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex == 2) {
      Get.to(LoginPage());
    } else {
      //int page = currentPageIndex.value + 1;
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    }
  }

  // void skipPage() {
  //   currentPageIndex = 2;
  //   pageController.jumpToPage(2);
  // }
}
