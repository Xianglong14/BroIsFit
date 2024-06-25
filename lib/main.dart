//import 'package:media_kit/media_kit.dart';

import 'app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: FirebaseOptions(
//           apiKey: "AIzaSyCHq1aLmtP6sjaSM2nIDFoemIUro3mB6C0",
//           authDomain: "testdb-8c845.firebaseapp.com",
//           projectId: "testdb-8c845",
//           storageBucket: "testdb-8c845.appspot.com",
//           messagingSenderId: "697567883217",
//           appId: "1:697567883217:web:d963664c21de259ba8baf0"),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    //MediaKit.ensureInitialized();
  } catch (e) {
    print(e);
  }
  await initializeFirebase();
  runApp(MyApp());
}

Future<void> initializeFirebase() async {
  // Check if an instance of Firebase already exists
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MainAppTheme.lightTheme,
      darkTheme: MainAppTheme.darkTheme,
      home: SplashScreen(
        child: Wrapper(),
      ),
    );
  }
}
