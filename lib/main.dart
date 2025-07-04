import 'package:batteryqk_web_app/app.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/language_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/controllers/build_listing_card_controller.dart';
import 'features/authentication/controllers/notification_controller.dart';
import 'features/authentication/controllers/user_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Register each controller ONCE with permanent: true
  if (!Get.isRegistered<NotificationController>()) {
    Get.put(NotificationController(), permanent: true);
  }
  if (!Get.isRegistered<UserController>()) {
    Get.put(UserController(), permanent: true);
  }
  if (!Get.isRegistered<LanguageController>()) {
    Get.put(LanguageController(), permanent: true);
  }
  if (!Get.isRegistered<BuildListingCardController>()) {
    Get.put(BuildListingCardController(), permanent: true);
  }

  runApp(const App());
}
