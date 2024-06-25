import '../../../app.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.color2,
      ),
      body: PreferencesBody(),
    );
  }
}

class PreferencesBody extends StatefulWidget {
  const PreferencesBody({super.key});

  @override
  State<PreferencesBody> createState() => _PreferencesBodyState();
}

class _PreferencesBodyState extends State<PreferencesBody> {
  List<String> _selectedOptions = [];
  final DetailCtrl ctrl = Get.find<DetailCtrl>();
  @override
  Widget build(BuildContext context) {
    _selectedOptions.sort();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "What's your preferences?",
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
                "You can select more than one. This will help us to customize the app just for you.",
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
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'fitness',
                      title: 'Get Fit',
                    ),
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'gain_weight',
                      title: 'Gain Weight',
                    ),
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'shape',
                      title: 'Improve Shape',
                    ),
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'lose_weight',
                      title: 'Lose Weight',
                    ),
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'building_body',
                      title: 'Building Body',
                    ),
                    SizedBox(height: 20),
                    PreferenceBTN(
                      selectedOptions: _selectedOptions,
                      keyword: 'other',
                      title: 'Other',
                    ),
                  ],
                )),
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
                    ctrl.userOptions = _selectedOptions;
                    // Get.to(() => WeightHomeScreen(),
                    //     transition: Transition.cupertinoDialog,
                    //     duration: Duration(seconds: 1));
                    ctrl.addUserDetail();
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

class PreferenceBTN extends StatefulWidget {
  const PreferenceBTN(
      {super.key,
      required this.selectedOptions,
      required this.title,
      required this.keyword});

  final List<String> selectedOptions;
  final String title;
  final String keyword;

  @override
  State<PreferenceBTN> createState() => _PreferenceBTNState();
}

class _PreferenceBTNState extends State<PreferenceBTN> {
  void _toggleOption(String option) {
    setState(() {
      if (widget.selectedOptions.contains(option)) {
        widget.selectedOptions.remove(option);
      } else {
        widget.selectedOptions.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _toggleOption(widget.keyword);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    width: 1.5,
                    color: widget.selectedOptions.contains(widget.keyword)
                        ? AppColor.color4
                        : Colors.transparent,
                  ),
                ),
                backgroundColor: AppColor.color6,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: AppColor.color1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
