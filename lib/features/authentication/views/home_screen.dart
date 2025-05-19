import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:get/route_manager.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/build_listing_card.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings_details1.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings_details2.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings_details3.dart';
import 'package:batteryqk_web_app/util/text_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _onViewAllPressed() {
    print('View All pressed!');
  }

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
              "Featured Activities",
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
                "Sports Academies",
                AppImages.penguinHead,
              ),
              _buildQuickAccessCardWithImage("Nurseries", AppImages.houseShape),
              _buildQuickAccessCardWithImage("Loyality Points", AppImages.car2),
              _buildQuickAccessCardWithImage("Coming Soon", AppImages.car1),
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
                        "Top Listings",
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
                          "View All",
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
                  title: AppText.academies1Title,
                  location: "Swimming | Downtown",
                  tag: "Paid",
                  rating: 4.5,
                  description: AppText.academies1Details,
                  imageUrl: AppImages.academies1a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListingsDetails1(),
                      ),
                    );
                  },
                ),
                BuildListingCard(
                  context: context,
                  title: AppText.academies2Title,
                  location: "Gym | Uptown",
                  tag: "Free",
                  rating: 4.0,
                  description: AppText.academies2Details,
                  imageUrl: AppImages.academies2a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListingsDetails2(),
                      ),
                    );
                  },
                ),
                BuildListingCard(
                  context: context,
                  title: AppText.academies3Title,
                  location: "Tennis | West Side",
                  tag: "Paid",
                  rating: 5.0,
                  description: AppText.academies3Details,
                  imageUrl: AppImages.academies3a,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListingsDetails3(),
                      ),
                    );
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
