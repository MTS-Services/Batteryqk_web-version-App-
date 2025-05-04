import 'package:batteryqk_web_app/util/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String listType;

  final List<String> countyList;

  const CustomDropdownButton({super.key, required this.countyList, required this.listType});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down),
              iconEnabledColor: AppColor.appLightGreenColor,
            ),
            hint: Text(
              widget.listType,
              style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
            ),
            value: selectedItem,
            items:
                widget.countyList
                    .map(
                      (String item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.appGreenColor,
                )
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
