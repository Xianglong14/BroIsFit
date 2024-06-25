import '../../app.dart';
import 'elevatedBtn_theme.dart';
import 'text_theme.dart';

class MainAppTheme {
  MainAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: MainTextTheme.lightTextTheme,
      elevatedButtonTheme: MainElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: AppBarTheme(color: Colors.white));
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MainTextTheme.darkTextTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
