import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../util/dropdown_menu_item.dart';

class MultiDropDown extends StatefulWidget {
  final void Function(List<String> selectedSports) onChange;
  const MultiDropDown({super.key, required this.onChange});

  @override
  State<MultiDropDown> createState() => _MultiDropDownState();
}

class _MultiDropDownState extends State<MultiDropDown> {
  final List<String> firstOptions = ['A. Individual Sports', 'B. Team Sports'];
  final Set<String> selectedFirst = {};
  final Set<String> selectedSubcategories = {};


  // Local map to track selected sports for immediate UI update
  Map<String, bool> selectedSportsMap = {};

  @override
  void initState() {
    super.initState();
    // Initialize selectedSportsMap empty or from sportsCategories if needed
    // Here we keep it empty initially
  }

  List<String> getAvailableSubcategories() {
    List<String> all = [];
    for (var selected in selectedFirst) {
      all.addAll(DropDownMenuItem.sportsCategories[selected]!.keys);
    }
    return all;
  }

  Map<String, bool> getSelectedSports() {
    final Map<String, bool> result = {};
    for (var sportType in selectedFirst) {
      final subcats =DropDownMenuItem.sportsCategories[sportType]!;
      for (var sub in selectedSubcategories) {
        final items = subcats[sub];
        if (items != null) {
          for (var entry in items.entries) {
            // Initialize in selectedSportsMap if not present
            if (!selectedSportsMap.containsKey(entry.key)) {
              selectedSportsMap[entry.key] = entry.value;
            }
            result[entry.key] = selectedSportsMap[entry.key]!;
          }
        }
      }
    }
    return result;
  }

  void toggleSportSelection(String sport, bool? value) {
    for (var type in selectedFirst) {
      for (var sub in selectedSubcategories) {
        if (DropDownMenuItem.sportsCategories[type]?[sub]?.containsKey(sport) == true) {
          DropDownMenuItem.sportsCategories[type]![sub]![sport] = value!;
        }
      }
    }
    setState(() {
      selectedSportsMap[sport] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final subcategories = getAvailableSubcategories();
    final selectedSports = getSelectedSports();

    return Column(
      children: [
        // Dropdown 1 - Category
        DropdownButtonFormField2<String>(
          dropdownStyleData: DropdownStyleData(
            maxHeight: 150,
            useSafeArea: true
          ),

          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Select Category',
            border: OutlineInputBorder(),
          ),
          value: null,
          hint: Text(
            selectedFirst.isEmpty ? 'Select A / B' : selectedFirst.join(', '),
            overflow: TextOverflow.ellipsis,
          ),
          items: firstOptions.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: StatefulBuilder(
                builder: (context, setInnerState) {
                  final isChecked = selectedFirst.contains(e);
                  return CheckboxListTile(
                    value: isChecked,
                    title: Text(e),
                    onChanged: (val) {
                      setInnerState(() {
                        setState(() {
                          if (val == true) {
                            selectedFirst.add(e);
                          } else {
                            selectedFirst.remove(e);
                            selectedSubcategories.removeWhere(
                                  (s) => DropDownMenuItem.sportsCategories[e]!.containsKey(s),
                            );
                            // Remove any sports of that category from selectedSportsMap
                            selectedSportsMap.removeWhere((key, _) {
                              final subcats = DropDownMenuItem.sportsCategories[e]!;
                              return subcats.values.any((map) => map.containsKey(key));
                            });
                          }
                        });
                      });
                    },
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),

        const SizedBox(height: 20),

        // Dropdown 2 - Subcategories
        DropdownButtonFormField2<String>(
          dropdownStyleData: DropdownStyleData(
              maxHeight: 250,
              useSafeArea: true
          ),
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Select Subcategories',
            border: OutlineInputBorder(),
          ),
          value: null,
          hint: Text(
            selectedSubcategories.isEmpty
                ? 'Choose subcategories'
                : selectedSubcategories.join(', '),
            overflow: TextOverflow.ellipsis,
          ),
          items: subcategories.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: StatefulBuilder(
                builder: (context, setInnerState) {
                  final isChecked = selectedSubcategories.contains(e);
                  return CheckboxListTile(
                    value: isChecked,
                    title: Text(e),
                    onChanged: (val) {
                      setInnerState(() {
                        setState(() {
                          if (val == true) {
                            selectedSubcategories.add(e);
                          } else {
                            selectedSubcategories.remove(e);
                            // Remove sports of this subcategory from selectedSportsMap
                            for (var type in selectedFirst) {
                              final subcatSports = DropDownMenuItem.sportsCategories[type]?[e];
                              if (subcatSports != null) {
                                subcatSports.keys.forEach((sport) {
                                  selectedSportsMap.remove(sport);
                                });
                              }
                            }
                          }
                        });
                      });
                    },
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),

        const SizedBox(height: 20),

        // Dropdown 3 - Sports with checkboxes
        DropdownButtonFormField2<String>(
    dropdownStyleData: DropdownStyleData(
    maxHeight: 150,
    useSafeArea: true
    ),
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Select Sports',
            border: OutlineInputBorder(),
          ),
          value: null,
          hint: Text(
            selectedSports.entries.where((e) => e.value).isEmpty
                ? 'Tap to select'
                : selectedSports.entries
                .where((e) => e.value)
                .map((e) => e.key)
                .join(', '),
            overflow: TextOverflow.ellipsis,
          ),
          items: selectedSports.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              // remove enabled: false to allow interaction
              child: StatefulBuilder(
                builder: (context, setInnerState) {
                  return CheckboxListTile(
                      value: entry.value,
                      title: Text(entry.key),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged:(val)=>widget.onChange
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
