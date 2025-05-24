import 'package:flutter/material.dart';

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
          offset: Offset(0, size.height + 5),
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
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: MediaQuery.of(context).size.width*0.315,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400),
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
                      color: _localSelectedValues.isEmpty
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
