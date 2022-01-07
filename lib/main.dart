import 'package:quantified_citizen/packages/config_packages.dart';
import 'package:quantified_citizen/packages/screen_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quantified Citizen',
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const OnBoardingScreen(),
      getPages: AppRouter.getPages,
      locale: Get.locale,
    );
  }
}
