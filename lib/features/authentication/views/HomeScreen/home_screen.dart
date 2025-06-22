import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../util/colors.dart';
import '../../controllers/build_listing_card_controller.dart';
import 'widgets/banner_section.dart';
import 'widgets/quick_access_section.dart';
import 'widgets/top_listing_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final BuildListingCardController apiController = Get.put(BuildListingCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: false),
      ),
      body: Obx(() {
        if (apiController.isloading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (apiController.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(apiController.errorMessage.value),
                ElevatedButton(
                  onPressed: apiController.fetchListData,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return ListView(
          children: [
            const SizedBox(height: 30),
            const BannerSection(),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "featured_activities".tr,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xff212121)),
              ),
            ),
            const QuickAccessSection(),
            const SizedBox(height: 30),
            TopListingsSection(apiController: apiController),
          ],
        );
      }),
    );
  }
}
