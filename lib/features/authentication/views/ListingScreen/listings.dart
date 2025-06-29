import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/custom_dropdown_Listings.dart';
import '../../../../common/widgets/multi_dropdown.dart';
import '../../../../util/colors.dart';
import '../../../../util/dropdown_menu_item.dart';
import '../../controllers/build_listing_card_controller.dart';
import 'widgets/listing_list.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool islogin = true;
  void _resetFilters() {
    // Add reset logic for each dropdown if necessary
    setState(() {
      islogin = false;
    });
    Navigator.pop(context);
  }
  final _listController = Get.find<BuildListingCardController>();
  final TextEditingController searchController = TextEditingController();

  Future<void> _refreshData() async => await _listController.fetchListData();
  Future<void> _applyFilters() async {
    String searchTerm = searchController.text.trim();
    _listController.isloading.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    _listController.applyFilter(
      priceType: 'All',
      category: 'All',
      searchTerm: searchTerm,
    );
    _listController.isloading.value = false;
    if (mounted) Navigator.pop(context);
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
                  itemList:  DropDownMenuItemList.location,
                  listType: 'all_location'.tr, onChanged: (String? value) {  },
                ),
                CustomDropdownListings(
                  itemList:  DropDownMenuItemList.ageGroup,
                  listType: 'age_group'.tr, onChanged: (String? value) {  },
                ),
                CustomDropdownListings(
                  itemList:  DropDownMenuItemList.rating,
                  listType: 'rating'.tr, onChanged: (String? value) {  },
                ),
                CustomDropdownListings(
                  itemList: DropDownMenuItemList.gender,
                  listType: 'Gender'.tr, onChanged: (String? value) {  },
                ),
                CustomDropdownListings(
                  itemList: DropDownMenuItemList.price,
                  listType: 'price'.tr, onChanged: (String? value) {  },
                ),

                const SizedBox(height: 30),

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
                const SizedBox(height: 40),
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: false),
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
                  onPressed: _listController.fetchListData,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ListingsList(listController: _listController)],
            ),
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
