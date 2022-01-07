import 'package:quantified_citizen/module/onBoarding/onboarding_controller.dart';
import 'package:quantified_citizen/packages/config_packages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _ctrl = Get.put(OnBoardingController());

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(keepPage: true, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: _ctrl.boardingList.length,
                onPageChanged: (index) {
                  if (index > 1) {
                    _ctrl.titleTextSize.value = 28;
                  } else {
                    _ctrl.titleTextSize.value = 22;
                  }
                  _ctrl.currentPageIndex.value = index;
                },
                itemBuilder: (context, index) {
                  var data = _ctrl.boardingList[index];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: squareImageFromAsset(data.boardImage),
                      ),
                      Obx(
                        () => Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Text(
                              data.boardTitle,
                              style: _ctrl.currentPageIndex.value == 0 ? textSemiBold(_ctrl.titleTextSize.value) : textRegular(_ctrl.titleTextSize.value),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            data.boardDesc,
                            style: textRegular(16).copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: _ctrl.boardingList.length,
              effect: WormEffect(dotWidth: 8, dotHeight: 8, activeDotColor: primaryColor, dotColor: Colors.grey.shade200),
              onDotClicked: (index) {},
            ),
            Obx(() {
              bool isCenterPosition = (_ctrl.currentPageIndex.value > 0 && _ctrl.currentPageIndex.value < 3);
              return Padding(
                padding: const EdgeInsets.all(30),
                child: actionButton(
                  _ctrl.currentPageIndex.value == 3 ? 'Sign up' : 'Next',
                  () {
                    if (_ctrl.currentPageIndex.value != 3) {
                      _ctrl.currentPageIndex.value = _ctrl.currentPageIndex.value + 1;
                      pageController.animateToPage(_ctrl.currentPageIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    } else {
                      Get.offAndToNamed(AppRouter.signUp);
                    }
                  },
                  bgColor: isCenterPosition ? whiteColor : primaryColor,
                  textColor: isCenterPosition ? primaryColor : whiteColor,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
