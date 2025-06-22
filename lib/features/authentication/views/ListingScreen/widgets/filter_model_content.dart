import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_dropdown_listings.dart';
import '../../../../../common/widgets/multi_dropdown.dart';
import '../../../../../util/colors.dart';
import '../../../../../util/dropdown_menu_item.dart';

class FilterModalContent extends StatelessWidget {
  final bool islogin;
  final List<String> price;
  final VoidCallback onApply;
  final VoidCallback onReset;

  const FilterModalContent({
    super.key,
    required this.islogin,
    required this.price,
    required this.onApply,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
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
              onChanged: (value) {},
            ),
            CustomDropdownListings(
              itemList: DropDownMenuItemList.ageGroup,
              listType: 'age_group'.tr,
              onChanged: (value) {
              
            },
            ),
            CustomDropdownListings(
              itemList: DropDownMenuItemList.rating,
              listType: 'rating'.tr,
                  onChanged: (value) {},
            ),
            CustomDropdownListings(itemList: price, listType: 'price'.tr,    onChanged: (value) {},),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onApply,
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
                    onPressed: onReset,
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
      ),
    );
  }
}
