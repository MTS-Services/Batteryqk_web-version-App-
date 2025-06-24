import 'package:batteryqk_web_app/util/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/Custom_dropdown_controller.dart';

class CustomDropdownButton extends StatelessWidget {
  final String listType;
  final double? fontSize;
  final List<String> itemList;

  // Constructor
  CustomDropdownButton({
    super.key,
    required this.itemList,
    required this.listType,
    this.fontSize = 16,
  });
final CustomDropdownController controller = Get.put(CustomDropdownController());

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Focus(
        focusNode: _focusNode,
        child: Obx(() {
          // Reactive UI rebuild on selectedItem change
          final isFocused = _focusNode.hasFocus;
          final selectedItem = controller.selectedItem.value;

          return DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: selectedItem,
              hint: Text(
                listType,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: itemList
                  .map(
                    (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
                  .toList(),
              onChanged: (value) {
                controller.changeSelectedItem(value);
              },
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: isFocused ? AppColor.blueColor : Colors.grey,
                ),
                iconSize: 20,
                iconEnabledColor: isFocused ? AppColor.blueColor : Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                isOverButton: false,
                maxHeight: 300,
                useSafeArea: true,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                elevation: 3,
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(AppColor.blueColor),
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: double.infinity,
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          );
        }),
      ),
    );
  }
}
