import '../../../../app.dart';
import '../signin.dart/signin.dart';
import '../signup/signup.dart';

class MyLoginPage extends StatelessWidget {
  final List<String> imageUrls = [
    "assets/images/logincarousel3.jpeg",
    "assets/images/logincarousel4.jpeg",
    "assets/images/logincarousel5.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: CarouselSlider.builder(
              itemCount: imageUrls.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollPhysics: NeverScrollableScrollPhysics(),
                pauseAutoPlayOnTouch: false, // Keep autoplay running on touch
                pauseAutoPlayOnManualNavigate:
                    false, // Keep autoplay running on manual navigation
              ),
              itemBuilder: (context, index, realIndex) {
                return Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                );
              },
            ),
          ),
          Positioned(
            bottom: 80.0,
            left: 0,
            right: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      "CRO",
                      style: GoogleFonts.alfaSlabOne(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                    Text(
                      "Track your goal",
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        overlayColor: AppColor.color1,
                        backgroundColor: Color(0xFF131313),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color(0xFFEDEDED),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFA2ED3A),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => SignInScreen());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
