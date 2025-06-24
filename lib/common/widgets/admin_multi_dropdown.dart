import 'package:batteryqk_web_app/util/dropdown_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/authentication/controllers/category_controller.dart';
import 'custom_multiSelect_dropdown.dart';

class AdminMultiDropdown extends StatefulWidget {
  const AdminMultiDropdown({super.key});

  @override
  State<AdminMultiDropdown> createState() => _AdminMultiDropdownState();
}

class _AdminMultiDropdownState extends State<AdminMultiDropdown> {
  List<String> selectedMainCategories = [];
  List<String> selectedSubCategories = [];
  List<String> selectedSports = [];
  final categoryController = Get.put(CategoryController());

  List<String> getAvailableSubCategories() {
    List<String> subs = [];
    for (var cat in selectedMainCategories) {
      subs.addAll(DropDownMenuItemList.sportsCategories[cat]!.keys);
    }
    return subs;
  }

  List<String> getAvailableSports() {
    List<String> sports = [];
    for (String sub in selectedSubCategories) {
      for (var cat in selectedMainCategories) {
        if (DropDownMenuItemList.sportsCategories[cat]?[sub] != null) {
          sports.addAll(DropDownMenuItemList.sportsCategories[cat]![sub]!.keys);
        }
      }
    }
    return sports.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> mainOptions = DropDownMenuItemList.sportsCategories.keys.toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomMultiSelectDropdown(
            title: "All Main Categories",
            options: mainOptions,
            selectedValues: selectedMainCategories,
            onSelectionChanged: (selected) {
              setState(() {
                selectedMainCategories = selected;
                selectedSubCategories = [];
                selectedSports = [];
              });
            },
          ),
          SizedBox(width: 10),
          CustomMultiSelectDropdown(
            title: "All Sports",
            options: getAvailableSports(),
            selectedValues: selectedSports,
            onSelectionChanged: (selected) {
              setState(() {
                selectedSports = selected;
              });
            },
          ),
          SizedBox(width: 10),
          CustomMultiSelectDropdown(

            title: "All Sports",
            options: getAvailableSports(),
            selectedValues: selectedSports,
            onSelectionChanged: (selected) {
              categoryController.updateSports(selected);
            },
          ),
        ],
      ),
    );
  }
}
