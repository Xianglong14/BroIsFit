import '../../../app.dart';
import 'weight.dart';

class AgeHomeScreen extends StatelessWidget {
  AgeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.color2,
      ),
      body: AgeBody(),
    );
  }
}

class AgeBody extends StatefulWidget {
  const AgeBody({super.key});

  @override
  State<AgeBody> createState() => _AgeBodyState();
}

class _AgeBodyState extends State<AgeBody> {
  final DetailCtrl ctrl = Get.find<DetailCtrl>();
  int selectedAge = 8;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "How old are you?",
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
                "Share your age. This will help us to customize the app just for you.",
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
                child: Container(
                  width: 110,
                  height: 500, // Set a fixed height for the ListWheelScrollView
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      setState(() {
                        selectedAge = value + 8;
                      });
                    },
                    itemExtent: 80,
                    perspective: 0.004,
                    diameterRatio: 1.3,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 101 - 8,
                      builder: (context, index) {
                        final age = index + 8;
                        return MyAge(
                          age: age,
                          selectedAge: selectedAge,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.color3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.color2,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ctrl.userAge = selectedAge;
                    Get.to(() => WeightHomeScreen(),
                        transition: Transition.cupertinoDialog,
                        duration: Duration(seconds: 1));
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
                              fontWeight: FontWeight.bold,
                            ),
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

class MyAge extends StatelessWidget {
  final int age;
  final int selectedAge;

  MyAge({required this.age, required this.selectedAge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            age.toString(),
            style: TextStyle(
              fontSize: age == selectedAge ? 60 : 40,
              color: age == selectedAge ? AppColor.color4 : AppColor.color5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
