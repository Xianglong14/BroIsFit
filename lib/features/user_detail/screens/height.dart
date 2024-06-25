import '../../../app.dart';
import 'preferences.dart';

class HeightScreen extends StatelessWidget {
  HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.color2,
      ),
      body: HeightBody(),
    );
  }
}

class HeightBody extends StatefulWidget {
  const HeightBody({super.key});

  @override
  State<HeightBody> createState() => _HeightBodyState();
}

class _HeightBodyState extends State<HeightBody> {
  final DetailCtrl ctrl = Get.find<DetailCtrl>();
  final startNumber = 130;
  int selelectedHeight = 130;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "What's your height(CM)?",
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
                child: Container(
                  width: 110,
                  height: 500, // Set a fixed height for the ListWheelScrollView
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      setState(() {
                        selelectedHeight = value + startNumber;
                      });
                    },
                    itemExtent: 80,
                    perspective: 0.004,
                    diameterRatio: 1.3,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 100,
                      builder: (context, index) {
                        final number = startNumber + index;
                        return MyHeight(
                          height: number,
                          selectedHeight: selelectedHeight,
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
                    ctrl.userHeight = selelectedHeight;
                    Get.to(() => PreferencesScreen(),
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

class MyHeight extends StatelessWidget {
  final int height;
  final int selectedHeight;

  MyHeight({required this.height, required this.selectedHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            height.toString(),
            style: TextStyle(
              fontSize: height == selectedHeight ? 60 : 40,
              color:
                  height == selectedHeight ? AppColor.color4 : AppColor.color5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
