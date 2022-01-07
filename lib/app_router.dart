import 'package:quantified_citizen/packages/config_packages.dart';
import 'package:quantified_citizen/packages/screen_package.dart';

class AppRouter {
  static const onBoarding = '/onBoarding';
  static const signUp = '/signUp';
  static const signIn = '/signIn';

  static List<GetPage> getPages = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
  ];
}
