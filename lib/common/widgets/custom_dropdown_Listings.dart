import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/custom_dropdown_controller.dart'; // Controller path ঠিক করো
import '../../util/colors.dart';

class CustomDropdownListings extends StatelessWidget {
  final String listType;
  final List<String> itemList;
  final ValueChanged<String?> onChanged;

  // Controller instance
  final CustomDropdownController controller = Get.put(CustomDropdownController());

  CustomDropdownListings({
    super.key,
    required this.itemList,
    required this.listType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Obx(() {
        final selectedItem = controller.selectedItem.value;

        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            value: selectedItem,
            hint: Text(
              listType,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
            items: itemList
                .map(
                  (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
                .toList(),
            onChanged: (value) {
              controller.changeSelectedItem(value);
              onChanged(value);
            },
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 25,
              iconEnabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(
                  AppColor.blueColor.withOpacity(0.7),
                ),
                radius: const Radius.circular(8),
              ),
            ),
            buttonStyleData: ButtonStyleData(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        );
      }),
    );
  }
}
