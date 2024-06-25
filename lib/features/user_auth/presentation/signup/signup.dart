import '../../../../app.dart';
import '../../../user_detail/screens/gender.dart';
import '../signin.dart/signin.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isSigningUp = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        backgroundColor: AppColor.color2,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "Create Your Account",
                      style: GoogleFonts.montserrat(
                        color: AppColor.color1,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "Enter your details to continue",
                      style: GoogleFonts.montserrat(
                        color: AppColor.color3,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              signup_title_widget(title: "Username"),
              SizedBox(height: 5),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "enter your username...",
                isPasswordField: false,
              ),
              SizedBox(height: 30),
              signup_title_widget(title: "Email address"),
              SizedBox(height: 5),
              FormContainerWidget(
                controller: _emailController,
                hintText: "enter your email address...",
                isPasswordField: false,
              ),
              SizedBox(height: 30),
              signup_title_widget(title: "Password"),
              SizedBox(height: 5),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "enter your password...",
                isPasswordField: true,
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColor.color4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: _isSigningUp == true
                        ? const CircularProgressIndicator(
                            color: AppColor.color2,
                          )
                        : const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColor.color2,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AlreadyHaveAccWidget()
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSigningUp = false;
    });
    if (user != null) {
      showSuccessToast("You account has been successfully created");
      Get.to(() => GenderHomeScreen());
      Get.put(DetailCtrl());
    } else {
      print("Some error happened");
    }
  }
}

class AlreadyHaveAccWidget extends StatelessWidget {
  const AlreadyHaveAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(color: AppColor.color1, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.to(() => SignInScreen());
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}

class signup_title_widget extends StatelessWidget {
  const signup_title_widget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        color: AppColor.color1,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
