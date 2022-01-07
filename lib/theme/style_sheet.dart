//font weight
import 'package:quantified_citizen/packages/config_packages.dart';

const FontWeight thin = FontWeight.w100;
const FontWeight extraLight = FontWeight.w200;
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight thick = FontWeight.w900;

//font family
String textFontFamily = "Poppins";

//App Theme
ThemeData appTheme = ThemeData(
  //for page effect
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  ),
  // Define the default colors.
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  accentColor: Colors.black,
  scaffoldBackgroundColor: bgColor,
  backgroundColor: bgColor,
  cardColor: whiteColor,
  dialogBackgroundColor: whiteColor,

  //Define the default font family
  fontFamily: textFontFamily,

  //app bar
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
  ),
);

//Functions
TextStyle textExtraBold(double size, {Color? color}) {
  return TextStyle(fontSize: size, fontWeight: extraBold, color: color ?? blackColor);
}

TextStyle textSemiBold(double size, {Color? color}) {
  return TextStyle(fontSize: size, fontWeight: FontWeight.w600, color: color ?? blackColor);
}

TextStyle textRegular(double size, {Color? color}) {
  return TextStyle(fontSize: size, color: color ?? blackColor);
}

TextStyle textMedium(double size, {Color? color}) {
  return TextStyle(fontSize: size, color: color ?? blackColor, fontWeight: medium);
}
