import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../util/colors.dart';
import '../../util/dropdown_menu_item.dart';

class CustomDropdownListings extends StatefulWidget {
  final String listType;
  final List<String> itemList;

  const CustomDropdownListings({
    super.key,
    required this.itemList,
    required this.listType,
  });

  @override
  State<CustomDropdownListings> createState() => _CustomDropdownListingsState();
}

class _CustomDropdownListingsState extends State<CustomDropdownListings> {
  String? selectedItem;
  bool _hasCheckbox(String item) {
    return DropDownMenuItem.getAllSports().contains(item);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedItem,
          hint: Text(
            widget.listType,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          items: widget.itemList.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  if (_hasCheckbox(item))
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedItem == item) {
                            selectedItem = null;
                          } else {
                            selectedItem = item;
                          }
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: selectedItem == item
                              ? AppColor.blueColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: selectedItem == item
                                ? AppColor.blueColor
                                : Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                        child: selectedItem == item
                            ? const Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        )
                            : null,
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 25,
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
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
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
      ),
    );
  }
}
