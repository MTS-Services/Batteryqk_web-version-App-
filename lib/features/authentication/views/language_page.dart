import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/language_controller.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/notification_controller.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/build_listing_card_controller.dart';
import '../controllers/user_controller.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the LanguageController instance
    final LanguageController languageController =
        Get.find<LanguageController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const CustomAppBar(isBack: true),
      ),
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          const SizedBox(height: 20),
          // English Language Option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: AppColor.whiteColor,
              child: ListTile(
                title: Text("english_language".tr), // Use the translation
                onTap: () {
                  // Toggle the language to English
                  languageController.toggleLanguage(true);
                  Get.find<BuildListingCardController>().refreshForLanguage();
                  Get.find<NotificationController>().fetchNotifications();
                  Get.find<UserController>().fetchUser();
                  // Navigate to the bottom navigation
                  Get.offAll(
                    () => CustomBottomNavigationBar(),
                    arguments: {'refresh': true},
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Arabic Language Option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: AppColor.whiteColor,
              child: ListTile(
                title: Text("Arabic".tr), // Use the translation
                onTap: () {
                  // Toggle the language to Arabic
                  languageController.toggleLanguage(false);
                  Get.find<BuildListingCardController>().refreshForLanguage();
                  Get.find<NotificationController>().fetchNotifications();
                  Get.find<UserController>().fetchUser();
                  // Navigate to the bottom navigation
                  Get.offAll(
                    () => CustomBottomNavigationBar(),
                    arguments: {'refresh': true},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
