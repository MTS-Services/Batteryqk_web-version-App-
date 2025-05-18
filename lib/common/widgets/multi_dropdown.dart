import 'package:batteryqk_web_app/util/dropdown_menu_item.dart';
import 'package:flutter/material.dart';

class MultiDropDown extends StatefulWidget {
  @override
  _MultiDropDownState createState() =>
      _MultiDropDownState();
}

class _MultiDropDownState
    extends State<MultiDropDown> {
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
        CustomMultiSelectDropdown(
          title: "All Subcategories",
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
          title: "All Sports",
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

class CustomMultiSelectDropdown extends StatefulWidget {
  final String title;
  final List<String> options;
  final List<String> selectedValues;
  final void Function(List<String>) onSelectionChanged;

  const CustomMultiSelectDropdown({
    Key? key,
    required this.title,
    required this.options,
    required this.selectedValues,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<CustomMultiSelectDropdown> createState() =>
      _CustomMultiSelectDropdownState();
}

class _CustomMultiSelectDropdownState extends State<CustomMultiSelectDropdown> {
  bool _isDropdownOpened = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  late List<String> _localSelectedValues;

  @override
  void initState() {
    super.initState();
    _localSelectedValues = List.from(widget.selectedValues);
  }

  @override
  void didUpdateWidget(covariant CustomMultiSelectDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValues != oldWidget.selectedValues) {
      _localSelectedValues = List.from(widget.selectedValues);
    }
  }

  void _toggleDropdown() {
    if (_isDropdownOpened) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final overlay = Overlay.of(context)!;
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
    _isDropdownOpened = true;
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownOpened = false;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx,
            width: size.width,
            top: offset.dy + size.height + 5,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 5),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child:
                      widget.options.isEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No options available',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                          : ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children:
                                widget.options.map((option) {
                                  bool checked = _localSelectedValues.contains(
                                    option,
                                  );
                                  return CheckboxListTile(
                                    title: Text(option),
                                    value: checked,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          if (!_localSelectedValues.contains(
                                            option,
                                          ))
                                            _localSelectedValues.add(option);
                                        } else {
                                          _localSelectedValues.remove(option);
                                        }
                                      });

                                      widget.onSelectionChanged(
                                        List.from(_localSelectedValues),
                                      );

                                      // Close & reopen overlay to force rebuild and update UI
                                      _closeDropdown();
                                      Future.delayed(
                                        Duration(milliseconds: 1),
                                        () {
                                          _openDropdown();
                                        },
                                      );
                                    },
                                  );
                                }).toList(),
                          ),
                ),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayText;
    if (_localSelectedValues.isEmpty) {
      displayText = widget.title;
    } else {
      displayText = _localSelectedValues.join(", ");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            height: 42,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    displayText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          _localSelectedValues.isEmpty
                              ? Colors.grey
                              : Colors.black,
                    ),
                  ),
                ),
                Icon(
                  _isDropdownOpened
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
