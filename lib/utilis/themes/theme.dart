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
    scaffoldBackgroundColor: AppColor.color2,
    textTheme: MainTextTheme.lightTextTheme,
    elevatedButtonTheme: MainElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppBarTheme(color: AppColor.color2),
    cardColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white,
      //shadowColor: Colors.grey.withOpacity(0.5),
      //elevation: 5,
      //margin: EdgeInsets.all(10),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
    ),
  );
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
