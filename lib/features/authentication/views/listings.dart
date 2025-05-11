import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown_Listings.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/listings_details_custom/build_listing_card.dart';
import '../../../util/images_path.dart';
import '../../../util/text_string.dart';
import 'listings_details1.dart';
import 'listings_details2.dart';
import 'listings_details3.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<String> categoryItem = [
    'Swimming',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Cricket',
    'Gymnastics',
    'Other',
  ];
  final List<String> location = [
    'New York',
    'London',
    'Dubai',
    'Tokyo',
    'Berlin',
    'Toronto',
    'Paris',
    'Other',
  ];
  final List<String> ageGroup = [
    'Toddlers (0-5 years)',
    'Children (6-12 years)',
    'Teenagers (13-18 years)',
    'Adults (18+)',
  ];
  final List<String> rating = [
    '1 Star',
    '2 Stars',
    '3 Stars',
    '4 Stars',
    '5 Stars',
  ];
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                CustomDropdownListings(
                  itemList: categoryItem,
                  listType: 'Category',
                ),
                CustomDropdownListings(
                  itemList: location,
                  listType: 'All Location',
                ),
                CustomDropdownListings(
                  itemList: ageGroup,
                  listType: 'Age Group',
                ),
                CustomDropdownListings(itemList: rating, listType: 'Rating'),
                CustomDropdownListings(itemList: price, listType: 'Price'),

                const SizedBox(height: 20),

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
                        label: const Text('Apply Filters'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              islogin
                                  ? AppColor.blueColor
                                  : Colors.grey.shade200,
                          foregroundColor:
                              islogin ? Colors.white : Colors.black87,
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
                        label: const Text('Reset'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              islogin
                                  ? Colors.grey.shade200
                                  : AppColor.blueColor,
                          foregroundColor:
                              islogin ? Colors.black87 : Colors.white,
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
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: false),
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
                        BuildListingCard(
                          context: context,
                          title: AppText.academies4Title,
                          location: "Basketball | Downtown",
                          tag: "Paid",
                          rating: 4.5,
                          description: AppText.academies4Details,
                          imageUrl: AppImages.academies4a,
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
                          title: AppText.academies5Title,
                          location: "Tennis | south Side",
                          tag: "Free",
                          rating: 5.0,
                          description: AppText.academies5Details,
                          imageUrl: AppImages.academies5a,
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
                          title: AppText.academies6Title,
                          location: "School | south Side",
                          tag: "Paid",
                          rating: 4.8,
                          description: AppText.academies6Details,
                          imageUrl: AppImages.academies6a,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListingsDetails1(),
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
          Positioned(
            bottom: 100,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blueColor.withOpacity(0.4),
                    blurRadius: 16,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: _showFilterModal,
                backgroundColor: AppColor.blueColor,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  size: 28,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
