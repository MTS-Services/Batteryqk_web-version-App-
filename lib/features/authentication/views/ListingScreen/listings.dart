import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../util/colors.dart';
import '../../controllers/build_listing_card_controller.dart';
import 'widgets/listing_list.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool islogin = true;
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Academy Search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search....',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onFieldSubmitted: (_) => _applyFilters(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _listController.resetFilter,
                      child: const Text('Reset'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _applyFilters,
                      child: const Text('Search'),
                    ),
                  ],
                ),
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
        child: const Icon(Icons.search, size: 28, color: AppColor.whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
