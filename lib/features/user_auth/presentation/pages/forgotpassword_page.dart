import '../../../../app.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      print(_emailController.text);
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showSuccessToast("Password link sent. Please check your email");
    } on FirebaseAuthException catch (e) {
      print(e);
      showErrorToast("some error occured: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
        // title: const Text(
        //   'Sign Up',
        //   style: TextStyle(color: Colors.white),
        // ),
        actions: [Container()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Your Email and we will sendyou a password reset link.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: PasswordReset,
            child: Text("Reset Password"),
          ),
        ],
      ),
    );
  }
}
