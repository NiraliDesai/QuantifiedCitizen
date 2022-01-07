import 'package:flutter/gestures.dart';
import 'package:quantified_citizen/packages/config_packages.dart';
import 'package:quantified_citizen/packages/screen_package.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _ctrl = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'.toUpperCase(), style: textSemiBold(20).copyWith(color: blackColor)),
        elevation: 1,
        backgroundColor: whiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please enter the 12 word passphrase that is associated with your account.',
                      style: textRegular(18),
                    ),
                  ),
                  ListView.separated(
                    itemCount: 12,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(color: Colors.grey.withOpacity(0.5)),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${index + 1}', style: textMedium(16)),
                          sizeWidth(10),
                          Expanded(
                            child: textField(TextEditingController(), '', '', TextInputType.text, showOutlines: false),
                          ),
                          sizeWidth(10),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'By tapping Sign In, you agree tp this app\'s', style: textRegular(14).copyWith(color: Colors.grey.withOpacity(0.8))),
                  WidgetSpan(child: sizeWidth(5)),
                  TextSpan(
                    text: 'Terms',
                    style: textMedium(14).copyWith(color: primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://quantifiedcitizen.com/terms-of-use/');
                      },
                  ),
                  WidgetSpan(child: sizeWidth(5)),
                  TextSpan(text: ' and ', style: textRegular(14).copyWith(color: Colors.grey.withOpacity(0.8))),
                  WidgetSpan(child: sizeWidth(5)),
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
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: actionButton('Sign In', () {
              Get.snackbar(
                'Successful',
                "SignIn successful",
                backgroundColor: primaryColor,
                colorText: whiteColor,
                margin: const EdgeInsets.all(20),
              );
            }),
          )
        ],
      ),
    );
  }
}
