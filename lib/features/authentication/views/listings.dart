import 'package:batteryqk_web_app/common/widgets/admin_multi_dropdown.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown_Listings.dart';
import 'package:batteryqk_web_app/common/widgets/multi_dropdown.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/dropdown_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/listings_details_custom/build_listing_card.dart';
import '../../../util/images_path.dart';
import 'listings_details1.dart';
import 'listings_details2.dart';
import 'listings_details3.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<String> price = ['Free', 'Paid', 'Subscription'];

  bool islogin = true;

  void _resetFilters() {
    // Add reset logic for each dropdown if necessary
    setState(() {
      islogin = false;
    });
    Navigator.pop(context);
  }

  void _showFilterModal() {
    showModalBottomSheet(
      backgroundColor: AppColor.whiteColor,
      elevation: 4,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'apply_filters'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              MultiDropDown(),
              const SizedBox(height: 12),
              CustomDropdownListings(
                itemList: DropDownMenuItemList.categoryItem,
                listType: 'category'.tr,
              ),
              CustomDropdownListings(
                itemList:  DropDownMenuItemList.location,
                listType: 'all_location'.tr,
              ),
              CustomDropdownListings(
                itemList:  DropDownMenuItemList.ageGroup,
                listType: 'age_group'.tr,
              ),
              CustomDropdownListings(
                itemList:  DropDownMenuItemList.rating,
                listType: 'rating'.tr,
              ),
              CustomDropdownListings(
                itemList: price,
                listType: 'price'.tr,
              ),

                const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          islogin = true;
                        });
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: Text('apply_filters'.tr),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            islogin ? AppColor.blueColor : Colors.grey.shade200,
                        foregroundColor: islogin ? Colors.white : Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _resetFilters,
                      icon: const Icon(Icons.refresh),
                      label: Text('reset'.tr),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            islogin ? Colors.grey.shade200 : AppColor.blueColor,
                        foregroundColor: islogin ? Colors.black87 : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const CustomAppBar(isBack: false),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(),
                const SizedBox(height: 24),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BuildListingCard(
                          context: context,
                          title: 'academies_1_title'.tr,
                          location: "Swimming | Downtown",
                          tag: "Paid",
                          rating: 4.5,
                          description: 'academies_1_details'.tr,
                          imageUrl: AppImages.academies1a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails1(),
                              ),
                            );
                          },
                        ),
                        BuildListingCard(
                          context: context,
                          title: 'academies_2_title'.tr,
                          location: "Gym | Uptown",
                          tag: "Free",
                          rating: 4.0,
                          description: 'academies_2_details'.tr,
                          imageUrl: AppImages.academies2a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails2(),
                              ),
                            );
                          },
                        ),
                        BuildListingCard(
                          context: context,
                          title: 'academies_3_title'.tr,
                          location: "Tennis | West Side",
                          tag: "Paid",
                          rating: 5.0,
                          description: 'academies_3_details'.tr,
                          imageUrl: AppImages.academies3a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails3(),
                              ),
                            );
                          },
                        ),
                        BuildListingCard(
                          context: context,
                          title: 'academies_4_title'.tr,
                          location: "Basketball | Downtown",
                          tag: "Paid",
                          rating: 4.5,
                          description: 'academies_4_details'.tr,
                          imageUrl: AppImages.academies4a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails1(),
                              ),
                            );
                          },
                        ),
                        BuildListingCard(
                          context: context,
                          title: 'academies_5_title'.tr,
                          location: "Tennis | south Side",
                          tag: "Free",
                          rating: 5.0,
                          description: 'academies_5_details'.tr,
                          imageUrl: AppImages.academies5a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails1(),
                              ),
                            );
                          },
                        ),
                        BuildListingCard(
                          context: context,
                          title: 'academies_6_title'.tr,
                          location: "School | south Side",
                          tag: "Paid",
                          rating: 4.8,
                          description: 'academies_6_details'.tr,
                          imageUrl: AppImages.academies6a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListingsDetails1(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Your listing cards would go here...
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFilterModal,
        backgroundColor: AppColor.blueColor,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.filter_alt_outlined,
          size: 28,
          color: AppColor.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
