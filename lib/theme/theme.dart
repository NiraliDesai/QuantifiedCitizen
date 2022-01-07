import 'package:quantified_citizen/packages/config_packages.dart';

class AppTheme {
  // App theme to set color globally in App
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bgColor,
    primaryColor: primaryColor,
    canvasColor: bgColor,
    appBarTheme: const AppBarTheme(color: primaryColor, iconTheme: IconThemeData(color: Colors.white)),
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: primaryColor),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: blackColor),
      bodyText2: TextStyle(color: blackColor),
      headline4: TextStyle(color: blackColor),
      headline1: TextStyle(color: blackColor),
    ),
  );
}
