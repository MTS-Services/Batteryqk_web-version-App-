import 'package:batteryqk_web_app/features/authentication/controllers/build_listing_card_controller.dart';
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
  HomeScreen({super.key});

  final BuildListingCardController apiController = Get.put(
    BuildListingCardController(),
  );

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
                  onPressed: () {
                    apiController.fetchListData();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return ListView(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
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
              childAspectRatio: MediaQuery.of(context).size.height * 0.001,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildQuickAccessCardWithImage(
                  "sprots_academies".tr,
                  AppImages.penguinHead,
                  context,
                ),
                _buildQuickAccessCardWithImage(
                  "nurseries".tr,
                  AppImages.houseShape,
                  context,
                ),
                _buildQuickAccessCardWithImage(
                  "loyalty_points".tr,
                  AppImages.car2,
                  context,
                ),
                _buildQuickAccessCardWithImage(
                  "comming_soon".tr,
                  AppImages.car1,
                  context,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "top_listings".tr,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
                  ...List.generate(3, (index) {
                    return BuildListingCard(
                      context: context,
                      title: apiController.listingCardData[index].name,
                      location:
                          '${apiController.listingCardData[index].mainFeatures} | ${apiController.listingCardData[index].location}',
                      tag: apiController.listingCardData[index].price,
                      rating: 4.5,
                      description:
                          apiController.listingCardData[index].description,
                      imageUrl: apiController.listingCardData[index].mainImage,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ListingsDetails(
                                  mainImage:
                                      apiController
                                          .listingCardData[index]
                                          .mainImage,
                                  description:
                                      apiController
                                          .listingCardData[index]
                                          .description,
                                  location:
                                      '${apiController.listingCardData[index].mainFeatures} | ${apiController.listingCardData[index].location}',
                                  tag:
                                      apiController
                                          .listingCardData[index]
                                          .price,
                                  title:
                                      apiController.listingCardData[index].name,
                                  subImage1:
                                      apiController
                                          .listingCardData[index]
                                          .subImage1,
                                  subImage2:
                                      apiController
                                          .listingCardData[index]
                                          .subImage2,
                                  subImage3:
                                      apiController
                                          .listingCardData[index]
                                          .subImage3,
                                  subImage4:
                                      apiController
                                          .listingCardData[index]
                                          .subImage4,
                                  ageGroup:
                                      apiController
                                          .listingCardData[index]
                                          .ageGroup[0],
                                  facility:
                                      apiController
                                          .listingCardData[index]
                                          .facilities[0],
                                  categoriesList:
                                      apiController
                                          .listingCardData[0]
                                          .specificItemNames,
                                ),
                          ),
                        );
                      },
                      bookingOnPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookScreen()),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildQuickAccessCardWithImage(
    String label,
    String imageUrl,
    BuildContext context,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
