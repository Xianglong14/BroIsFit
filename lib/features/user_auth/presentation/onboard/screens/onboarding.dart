import '../../../../../app.dart';
import '../../pages/logindemo.dart';
import '../controllers/onboard_ctrl.dart';

class OnboardScreens extends StatefulWidget {
  OnboardScreens({super.key});

  @override
  State<OnboardScreens> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  final controller = Get.put(OnboardCtrl());

  final List<String> images = [
    'assets/images/onboard1.jpeg',
    'assets/images/onboard2.jpeg',
    'assets/images/onboard3.jpeg',
  ];

  final List<String> title = [
    'Breathing during the exercise is important to prevent injuries, spikes in blood pressure and strain on blood vessels. Increasing blood flow increases the ability to relax.',
    'The heart is the strongest muscle in the body. The heart has the ability to beat over 3 billion times in a person\'s life. The strongest muscle based on its weight is the masseter. With all muscles of the jaw working together it can close the teeth.',
    '\'Yoga\' was developed by the \'Indus-Sarasvati\' civilization in Northeren India over 5,000 years ago.',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 380,
                left: (MediaQuery.of(context).size.width - 350) / 2,
                child: Container(
                  height: 250,
                  width: 350,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(96, 99, 97, 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Did you know",
                            style: GoogleFonts.breeSerif(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.contact_support,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        title[_currentIndex],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: (MediaQuery.of(context).size.width - 350) / 2,
                child: Container(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        onDotClicked: controller.dotNavigationClick,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 18,
                          activeDotColor: Color(0xFFa8ec3c),
                          dotColor: Color.fromARGB(255, 234, 239, 234),
                        ),
                      ),
                      _currentIndex == 2
                          ? GestureDetector(
                              onTap: () {
                                Get.to(() => MyLoginPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFa8ec3c),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    "Start",
                                    style: TextStyle(
                                        color: AppColor.color2,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.nextPage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "Skip",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFa8ec3c),
                                        //Color.fromARGB(255, 170, 233, 172),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color.fromARGB(255, 170, 233, 172),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
