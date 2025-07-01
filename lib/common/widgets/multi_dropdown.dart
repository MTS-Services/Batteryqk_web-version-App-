import 'package:batteryqk_web_app/util/dropdown_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_multiSelect_dropdown.dart';

class MultiDropDown extends StatefulWidget {
  const MultiDropDown({super.key});

  @override
  MultiDropDownState createState() => MultiDropDownState();
}

class MultiDropDownState extends State<MultiDropDown> {
  List<String> selectedMainCategories = [];
  List<String> selectedSubCategories = [];
  List<String> selectedSports = [];

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
    return sports.toSet().toList(); // remove duplicates
  }

  @override
  Widget build(BuildContext context) {
    List<String> mainOptions =
        DropDownMenuItemList.sportsCategories.keys.toList();
    return Column(
      children: [
        CustomMultiSelectDropdown(
          title: "all_main_categories".tr,
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
        CustomMultiSelectDropdown(
          title: "all_sub_categories".tr,
          options: getAvailableSubCategories(),
          selectedValues: selectedSubCategories,
          onSelectionChanged: (selected) {
            setState(() {
              selectedSubCategories = selected;
              selectedSports = [];
            });
          },
        ),
        CustomMultiSelectDropdown(
          title: "all_sports".tr,
          options: getAvailableSports(),
          selectedValues: selectedSports,
          onSelectionChanged: (selected) {
            setState(() {
              selectedSports = selected;
            });
          },
        ),
      ],
    );
  }
}
