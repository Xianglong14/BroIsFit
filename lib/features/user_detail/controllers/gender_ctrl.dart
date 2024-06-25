import '../../../app.dart';

class DetailCtrl extends GetxController {
  final CollectionReference userDetails =
      FirebaseFirestore.instance.collection("userDetail");
  var user = FirebaseAuth.instance.currentUser;

  var isloading = false.obs;
  String? userGender;
  int? userAge;
  int? userWeight;
  int? userHeight;
  List<String>? userOptions;

  @override
  void onInit() {
    loading();
    super.onInit();
    update();
  }

  void loading() {
    isloading.value = true;
    // final userID = user?.uid;
    // genders.add({});
    //print(userGender);
    new Future.delayed(new Duration(seconds: 2), () {
      isloading.value = false;
    });
  }

  Future<void> addUserDetail() {
    final userID = user?.uid;
    return userDetails.add({
      "userID": '2',
      "userAge": userAge,
      "userWeight": userWeight,
      "userHeight": userHeight,
      "userOptions": userOptions,
      "UserAddTime": Timestamp.now(),
    });
  }

  void printDetail() {
    //print(userID);
    print(userGender);
    print(userAge);
    print(userWeight);
    print(userHeight);
    print(userOptions);
  }

  // void collectUserDetail({String? gender, int? age, int? weight, int? height}) {
  //   userGender = gender;
  //   userAge = age;
  //   userWeight = weight;
  //   userHeight = height;

  //   print(userGender);
  //   print(userAge);
  // }
}
