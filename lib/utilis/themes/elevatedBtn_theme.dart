import '../../app.dart';

class MainElevatedButtonTheme {
  MainElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
  );
}
