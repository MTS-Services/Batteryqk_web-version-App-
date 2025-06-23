import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  var isEnglish = true.obs;

  void toggleLanguage(bool value) {
    isEnglish.value = value;
    print('Language toggled. isEnglish: $isEnglish');
    Get.updateLocale(Locale(value ? 'en' : 'ar', value ? 'US' : ''));
  }

  // Returns '' for English, 'ar' for Arabic
  String get currentLanguage => isEnglish.value ? '' : 'ar';
}
