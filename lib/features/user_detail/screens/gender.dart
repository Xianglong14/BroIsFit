import '../../../app.dart';
import 'age.dart';

class GenderHomeScreen extends GetView<DetailCtrl> {
  GenderHomeScreen({super.key});
  final DetailCtrl ctrl = Get.find<DetailCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.color2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.color2,
        ),
        body: Obx(
          () => ctrl.isloading.value ? Loader() : GenderScreen(),
        ));
  }
}

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen>
    with TickerProviderStateMixin {
  late final AnimationController maleAnimateController;
  late final AnimationController femaleAnimateController;

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  final DetailCtrl ctrl = Get.find<DetailCtrl>();

  @override
  void initState() {
    super.initState();
    maleAnimateController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    femaleAnimateController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    maleAnimateController.dispose();
    femaleAnimateController.dispose();
    super.dispose();
  }

  void playAnimation(AnimationController controller) {
    controller.reset();
    controller.forward();
  }

  String get selectedGender {
    if (isMaleSelected) {
      return 'Male';
    } else if (isFemaleSelected) {
      return 'Female';
    } else {
      return 'No Gender Selected';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "Tell us about youself!",
              style: GoogleFonts.montserrat(
                color: AppColor.color1,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: Text(
                "Please chose your gender or prefered identity. We value your uniqueness!",
                style: TextStyle(
                  color: AppColor.color3,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isMaleSelected) {
                            isMaleSelected = true;
                            isFemaleSelected = false;
                            playAnimation(maleAnimateController);
                            femaleAnimateController.reset();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMaleSelected
                              ? Colors.blue.withOpacity(0.7)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: LottieBuilder.asset(
                          "assets/icons/male.json",
                          height: 250,
                          controller: maleAnimateController,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!isFemaleSelected) {
                            isFemaleSelected = true;
                            isMaleSelected = false;
                            playAnimation(femaleAnimateController);
                            maleAnimateController.reset();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isFemaleSelected
                              ? Colors.pink.withOpacity(0.7)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: LottieBuilder.asset(
                          "assets/icons/female.json",
                          height: 250,
                          controller: femaleAnimateController,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      selectedGender,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    if (selectedGender != "No Gender Selected") {
                      //ctrl.collectUserDetail(gender: selectedGender);
                      ctrl.userGender = selectedGender;
                      Get.to(() => AgeHomeScreen(),
                          transition: Transition.cupertinoDialog,
                          duration: Duration(seconds: 1));
                    } else {
                      showErrorToast("Please select your gender");
                    }
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFa8ec3c),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                                color: AppColor.color2,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
