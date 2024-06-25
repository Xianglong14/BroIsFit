import '../../../../app.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.color1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.color2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 27),
              ),
              // Text(user!.uid.toString()),
              // Text(user!.metadata.lastSignInTime.toString()),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyLoginPage()),
                      (route) => false);
                  showSuccessToast("Successfully signed out");
                },
                child: Container(
                  width: 100,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
