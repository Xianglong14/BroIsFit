import '../../../../../app.dart';

class FitnessHomeCtrl extends GetxController {
  var isloading = false.obs;
  @override
  void onInit() {
    loadHome();
    super.onInit();
    update();
  }

  void loadHome() async {
    isloading.value = true;
    new Future.delayed(new Duration(seconds: 2), () {
      isloading.value = false;
    });
  }
}
