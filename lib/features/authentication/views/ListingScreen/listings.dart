import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../util/colors.dart';
import '../../controllers/build_listing_card_controller.dart';
import 'widgets/filter_model_content.dart';
import 'widgets/listing_list.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<String> price = ['Free', 'Paid', 'Subscription'];
  bool islogin = true;
  final _listController = Get.find<BuildListingCardController>();

  Future<void> _refreshData() async => await _listController.fetchListData();

  void _resetFilters() {
    setState(() {
      islogin = false;
    });
    Navigator.pop(context);
  }

  void _applyFilters() {
    setState(() {
      islogin = true;
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
        return FilterModalContent(
          islogin: islogin,
          price: price,
          onApply: _applyFilters,
          onReset: _resetFilters,
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
