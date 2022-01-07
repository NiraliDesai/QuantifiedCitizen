import 'package:flutter/gestures.dart';
import 'package:quantified_citizen/packages/config_packages.dart';
import 'package:quantified_citizen/packages/screen_package.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _ctrl = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'.toUpperCase(), style: textSemiBold(20).copyWith(color: blackColor)),
        elevation: 1,
        backgroundColor: whiteColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizeHeight(10),
            Text(
              _ctrl.signupTxt,
              style: textRegular(18).copyWith(color: blackColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Colors.grey.withOpacity(0.3)),
            ),
            Obx(() => Text(
                  _ctrl.securityParse.value,
                  style: GoogleFonts.jetBrainsMono(fontSize: 18, color: blackColor.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Colors.grey.withOpacity(0.3)),
            ),
            Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => _ctrl.isTermsAgreed.value = !_ctrl.isTermsAgreed.value,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _ctrl.isTermsAgreed.isTrue ? primaryColor : Colors.transparent,
                        border: Border.all(color: _ctrl.isTermsAgreed.isTrue ? primaryColor : Colors.grey.withOpacity(0.5)),
                      ),
                      width: 20,
                      height: 20,
                      child: _ctrl.isTermsAgreed.isTrue ? const Icon(Icons.check, size: 15.0, color: Colors.white) : null,
                    ),
                  ),
                ),
                sizeWidth(10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'I Agree to the ', style: textRegular(14).copyWith(color: Colors.grey.withOpacity(0.8))),
                      TextSpan(
                        text: 'Terms',
                        style: textMedium(14).copyWith(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://quantifiedcitizen.com/terms-of-use/');
                          },
                      ),
                      TextSpan(text: ' and ', style: textRegular(14).copyWith(color: Colors.grey.withOpacity(0.8))),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: textMedium(14).copyWith(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://quantifiedcitizen.com/terms-of-use/');
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            actionButton(
              'Sign Up',
              () {},
              leftPadding: 0.0,
              rightPadding: 0.0,
            ),
            sizeHeight(25),
            InkWell(
              onTap: () => Get.toNamed(AppRouter.signIn),
              child: Text(
                'Already have an account? Sign in',
                style: textMedium(15).copyWith(color: primaryColor),
              ),
            ),
            sizeHeight(30)
          ],
        ),
      ),
    );
  }
}
