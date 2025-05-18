import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  var isEnglish = true.obs;

  void toggleLanguage(bool value) {
    isEnglish.value = value;
    Get.updateLocale(Locale(value ? 'en' : 'ar'));
  }
}
