import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown_Listings.dart';
import 'package:batteryqk_web_app/common/widgets/multi_dropdown.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/build_listing_card_controller.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/dropdown_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/listings_details_custom/build_listing_card.dart';
import 'book_screen.dart';
import 'listings_details.dart';

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
        return SingleChildScrollView(
          child: Padding(
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
                CustomDropdownListings(
                  itemList: DropDownMenuItemList.location,
                  listType: 'all_location'.tr,
                ),
                CustomDropdownListings(
                  itemList: DropDownMenuItemList.ageGroup,
                  listType: 'age_group'.tr,
                ),
                CustomDropdownListings(
                  itemList: DropDownMenuItemList.rating,
                  listType: 'rating'.tr,
                ),
                CustomDropdownListings(itemList: price, listType: 'price'.tr),

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
                        label: Text('reset'.tr),
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

  final _listController = Get.find<BuildListingCardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const CustomAppBar(isBack: false),
      ),
      body: Obx(() {
        if (_listController.isloading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (_listController.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_listController.errorMessage.value),
                ElevatedButton(
                  onPressed: () {
                    _listController.fetchListData();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _listController.listingCardData.length,
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    var ageGroup =
                        _listController.listingCardData[index].ageGroup[0];
                    
                    
                    return BuildListingCard(
                      context: context,
                      title: _listController.listingCardData[index].name,
                      location:
                          '${_listController.listingCardData[index].mainFeatures} | ${_listController.listingCardData[index].location}',
                      tag: _listController.listingCardData[index].price,
                      rating: 4.5,
                      description:
                          _listController.listingCardData[index].description,
                      imageUrl:
                          _listController.listingCardData[index].mainImage,
                          averageRating: _listController.listingCardData[index].averageRating,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ListingsDetails(
                                  mainImage:
                                      _listController
                                          .listingCardData[index]
                                          .mainImage,
                                  title:
                                      _listController
                                          .listingCardData[index]
                                          .name,
                                  location:
                                      _listController
                                          .listingCardData[index]
                                          .location,
                                  tag:
                                      _listController
                                          .listingCardData[index]
                                          .price,
                                  description:
                                      _listController
                                          .listingCardData[index]
                                          .description,
                                  subImage1:
                                      _listController
                                          .listingCardData[index]
                                          .subImage1,
                                  subImage2:
                                      _listController
                                          .listingCardData[index]
                                          .subImage2,
                                  subImage3:
                                      _listController
                                          .listingCardData[index]
                                          .subImage3,
                                  subImage4:
                                      _listController
                                          .listingCardData[index]
                                          .subImage4,ageGroup: ageGroup,
                                          
                                          facility: _listController.listingCardData[index].facilities[0],
                                          categoriesList: _listController.listingCardData[0].specificItemNames,
                                          openingHours: _listController.listingCardData[index].operatingHours[0],
                                          reviews: _listController.listingCardData[index].reviews,
                                          averageRating: _listController.listingCardData[index].averageRating,
                                          numOfReviews: _listController.listingCardData[index].totalReviews,

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
                  },
                ),
              ),
            ],
          ),
        );
      }),
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
