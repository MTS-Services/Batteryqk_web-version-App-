import 'package:batteryqk_web_app/auth_chack.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/language_controller.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the LanguageController instance
    final LanguageController languageController =
        Get.find<LanguageController>();

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Image.asset(AppImages.logo, scale: 4),
            Spacer(),
            Text(
              'Choose your language'.tr,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: AppColor.whiteColor,
                child: ListTile(
                  title: Center(child: Text('English')), // Use the translation
                  onTap: () {
                    // Toggle the language to English
                    languageController.toggleLanguage(true);
                    // Get.find<BuildListingCardController>().refreshForLanguage();
                    // Get.find<NotificationController>().fetchNotifications();
                    // Get.find<UserController>().fetchUser();
                    // Navigate to the bottom navigation
                    Get.offAll(() => AuthCheck(), arguments: {'refresh': true});
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Arabic Language Option
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
              child: Card(
                color: AppColor.whiteColor,
                child: ListTile(
                  title: Center(child: Text("عربي")), // Use the translation
                  onTap: () {
                    // Toggle the language to Arabic
                    languageController.toggleLanguage(false);
                    // Get.find<BuildListingCardController>().refreshForLanguage();
                    // Get.find<NotificationController>().fetchNotifications();
                    // Get.find<UserController>().fetchUser();
                    // Navigate to the bottom navigation
                    Get.offAll(() => AuthCheck(), arguments: {'refresh': true});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
