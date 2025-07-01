import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/custom_dropdown_Listings.dart';
import '../../../../common/widgets/multi_dropdown.dart';
import '../../../../util/colors.dart';
import '../../controllers/build_listing_card_controller.dart';
import '../../controllers/dropdown_controller.dart';
import 'widgets/listing_list.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool islogin = true;
  String? selectedLocation;
  String? selectedAgeGroup;
  String? selectedRating;
  String? selectedGender;
  String? selectedPrice;
  void _resetFilters() {
    setState(() {
      islogin = false;
    });
    Navigator.pop(context);
  }

  final _listController = Get.find<BuildListingCardController>();
  final dropdownController = Get.put(DropdownController());
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async => await _listController.fetchListData();
  Future<void> applyFilter() async {
  }

  void _showFilterModal() {
    List<String> allLocation =
        _listController.listingCardData.map((e) => e.location).toSet().toList();
    List<String> ageGroup =
        _listController.listingCardData
            .map((e) => e.ageGroup[0])
            .toSet()
            .toList();
    List<String> rating =
        _listController.listingCardData
            .map((e) => e.averageRating.toString())
            .toSet()
            .toList();
    List<String> gender =
        _listController.listingCardData.map((e) => e.gender).toSet().toList();
    List<String> price =
        _listController.listingCardData.map((e) => e.price).toSet().toList();
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
                  itemList: allLocation,
                  listType: 'all_location'.tr,
                  onChanged: (String? value) {
                    dropdownController.selectedLocation.value = value;
                  },
                ),
                CustomDropdownListings(
                  itemList: ageGroup,
                  listType: 'age_group'.tr,
                  onChanged: (String? value) {
                    dropdownController.selectedAgeGroup.value = value;
                  },
                ),
                CustomDropdownListings(
                  itemList: rating,
                  listType: 'rating'.tr,
                  onChanged: (String? value) {
                    dropdownController.selectedRating.value = value;
                  },
                ),
                CustomDropdownListings(
                  itemList: gender,
                  listType: 'gender'.tr,
                  onChanged: (String? value) {
                    dropdownController.selectedGender.value = value;
                  },
                ),
                CustomDropdownListings(
                  itemList: price,
                  listType: 'price'.tr,
                  onChanged: (String? value) {
                    dropdownController.selectedPrice.value = value;
                  },
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: applyFilter,
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
