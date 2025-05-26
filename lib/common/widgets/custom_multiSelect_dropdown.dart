import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

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
      setState(() {
        _localSelectedValues = List.from(widget.selectedValues);
      });
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
    Future.microtask(() {
      final overlay = Overlay.of(context);
      _overlayEntry = _createOverlayEntry();
      overlay.insert(_overlayEntry!);
      _isDropdownOpened = true;
        });
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
      builder: (context) => Positioned(
        left: offset.dx,
        width: size.width,
        top: offset.dy + size.height + 5,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0,42),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: widget.options.isEmpty
                  ? const Padding(
                padding: EdgeInsets.all(8.0),
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
    String displayText = _localSelectedValues.isEmpty
        ? widget.title
        : _localSelectedValues.join(", ");

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
                value: _localSelectedValues.isEmpty ? null : _localSelectedValues.first,
              hint: Text(
                displayText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: _localSelectedValues.isEmpty ? Colors.grey.shade400 : Colors.black,
                ),
              ),

              items: [],
              onChanged: (value) {
                setState(() {
                });
              },
              iconStyleData: const IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 25,
                  iconEnabledColor: Colors.grey
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
                  thumbColor: WidgetStateProperty.all(
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
        ),
        ),
    );

  }
}
