import 'package:batteryqk_web_app/features/authentication/views/book_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:get/get.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/build_listing_card.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings_details.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: false),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      68,
                      145,
                      145,
                      145,
                    ).withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(AppImages.bannerImages),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "featured_activities".tr,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xff212121),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildQuickAccessCardWithImage(
                "sprots_academies".tr,
                AppImages.penguinHead,
              ),
              _buildQuickAccessCardWithImage(
                "nurseries".tr,
                AppImages.houseShape,
              ),
              _buildQuickAccessCardWithImage(
                "loyalty_points".tr,
                AppImages.car2,
              ),
              _buildQuickAccessCardWithImage("comming_soon".tr, AppImages.car1),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "top_listings".tr,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff212121),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Listings()),
                          );
                        },
                        child: Text(
                          "view_all".tr,
                          style: TextStyle(
                            color: AppColor.blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BuildListingCard(
                  context: context,
                  title: 'academies_1_title'.tr,
                  location: "activity.swimming.downtown".tr,
                  tag: "paid".tr,
                  rating: 4.5,
                  description: 'academies_1_details'.tr,
                  imageUrl: AppImages.academies1a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListingsDetails(),
                      ),
                    );
                  }, bookingOnPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
                },
                ),
                BuildListingCard(
                  context: context,
                  title: 'academies_2_title'.tr,
                  location: "activity.gym.uptown".tr,
                  tag: "free".tr,
                  rating: 4.0,
                  description: 'academies_2_details'.tr,
                  imageUrl: AppImages.academies2a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListingsDetails(),
                      ),
                    );
                  },
                  bookingOnPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
                  },
                ),
                BuildListingCard(
                  context: context,
                  title: 'academies_3_title'.tr,
                  location: "activity.tennis.westside".tr,
                  tag: "paid".tr,
                  rating: 5.0,
                  description: 'academies_3_details'.tr,
                  imageUrl: AppImages.academies3a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListingsDetails(),
                      ),
                    );
                  },
                  bookingOnPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCardWithImage(String label, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(76, 0, 187, 212),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(31, 0, 187, 212),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 40, color: Colors.red),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
