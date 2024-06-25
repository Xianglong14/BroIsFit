import '../../../app.dart';
import 'height.dart';

class WeightHomeScreen extends StatelessWidget {
  WeightHomeScreen({super.key});
  final DetailCtrl ctrl = Get.find<DetailCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.color2,
      ),
      body: WeightBody(),
    );
  }
}

class WeightBody extends StatefulWidget {
  const WeightBody({super.key});

  @override
  State<WeightBody> createState() => _WeightBodyState();
}

class _WeightBodyState extends State<WeightBody> {
  final DetailCtrl ctrl = Get.find<DetailCtrl>();
  int selectedWeight = 0;
  int userWeight = 30;
  final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "What's your weight(KG)?",
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
                "Don't worry, you can always change it later.",
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
                child: Transform.rotate(
                  angle: -1.57, // Rotate 90 degrees counter-clockwise
                  child: ListWheelScrollView(
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        selectedWeight = value;
                        userWeight = 30 + value;
                      });
                    },
                    controller: _controller,
                    itemExtent: 100,
                    diameterRatio: 1.5,
                    children: List.generate(200, (index) {
                      int displayNumber = 30 + index;
                      bool isSelected = index == selectedWeight;
                      return Transform.rotate(
                        angle:
                            1.57, // Rotate 90 degrees clockwise to make text horizontal
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              '$displayNumber',
                              style: TextStyle(
                                fontSize: isSelected ? 60 : 40,
                                color: isSelected
                                    ? AppColor.color4
                                    : AppColor.color5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                    ctrl.userWeight = userWeight;
                    Get.to(() => HeightScreen(),
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
