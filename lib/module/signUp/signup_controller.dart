import 'dart:math';

import 'package:flutter/services.dart';
import 'package:quantified_citizen/packages/config_packages.dart';

class SignUpController extends GetxController {
  String signupTxt =
      'We care about your privacy. Instead of your name or email, we identify your account with 12 random words. Please write down these words, in order, and store in a safe place in case you need to delete the app or change phones.\n\nWe don\'t have a copy of these words on our server and can\'t help you recover your account.\n\nYou can view them in your profile later via the menu on the top left.';

  RxBool isTermsAgreed = false.obs;

  RxString securityParse = ''.obs;

  final _randomNumber = Random();

  //get random 12 words from English-BIP39
  void _getRandomParse() async {
    var randomWordList = <String>[];
    var worldList = (await rootBundle.loadString('assets/english.txt')).split("\n").toList();
    for (var i = 0; i < 12; i++) {
      randomWordList.add(worldList[_randomNumber.nextInt(worldList.length)]);
    }
    securityParse.value = randomWordList.join(" ");
  }

  @override
  void onReady() {
    _getRandomParse();
    super.onReady();
  }
}
