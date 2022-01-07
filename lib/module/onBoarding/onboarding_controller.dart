import 'package:quantified_citizen/packages/config_packages.dart';

class OnBoardingController extends GetxController {
  RxDouble titleTextSize = 22.0.obs;
  RxInt currentPageIndex = 0.obs;

  List<OnBoardingData> boardingList = [
    OnBoardingData(
      imgOnBoard_1,
      'Welcome!',
      'Participate in and create anonymous, secure observational studies using Quantified Citizen.',
    ),
    OnBoardingData(
      imgOnBoard_2,
      'Find out more about yourself (while contributing to science)',
      'What are you interested in learning more about? Join an array of studies, related to health and wellbeing.',
    ),
    OnBoardingData(
      imgOnBoard_3,
      'Validated research methods',
      'We use study methods traditionally used in in-person clinical settings and bring it to the comfort of your home.',
    ),
    OnBoardingData(
      imgOnBoard_4,
      'Anonymity\nand privacy',
      'Your privacy is very important to us. Participation in our studies is anonymous, which means we don\'t collect your email and personally identifiable information.',
    ),
  ];

}
