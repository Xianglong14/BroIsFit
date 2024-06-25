import '../../../../app.dart';
import 'home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            if (snapshot.data == null) {
              return OnboardScreens();
            } else {
              return HomePage();
            }
          }
        },
      ),
    );
  }
}
