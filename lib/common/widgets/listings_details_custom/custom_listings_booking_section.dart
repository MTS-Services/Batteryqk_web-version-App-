import 'package:flutter/material.dart';

import '../../../util/colors.dart';
import '../../styles/styles.dart';
import '../custom_button.dart';
import '../custom_dropdown.dart';
import '../custom_dropdown_Listings.dart';
import 'custom_icon.dart';

class CustomListingsBookingSection extends StatefulWidget {
  final TextEditingController dateController;
  final String number;
  final String gmail;
  final String web;

  const CustomListingsBookingSection({
    super.key,
    required this.dateController,
    required this.number,
    required this.gmail,
    required this.web,
  });

  @override
  State<CustomListingsBookingSection> createState() =>
      _CustomListingsBookingSectionState();
}

class _CustomListingsBookingSectionState
    extends State<CustomListingsBookingSection> {
  DateTime? selectedDate;

  final List<String> timeList = [
    "1:00 AM",
    "2:00 AM",
    "3:00 AM",
    "4:00 AM",
    "5:00 AM",
    "6:00 AM",
    "7:00 AM",
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
    "8:00 PM",
    "9:00 PM",
    "10:00 PM",
    "11:00 PM",
    "12:00 AM",
  ];
  final List<String> personNumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        CustomSectionHeaderText('Book a Session'),
        SizedBox(height: 30),
        Text('Date'),
        TextField(
          controller: widget.dateController,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.blueColor),
            ),
            labelText: 'Date/Month/year',
            suffixIcon: IconButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: selectedDate ?? DateTime.now(),
                );
                if (pickedDate != null) {
                  selectedDate = pickedDate;
                  final formattedDate =
                      "${pickedDate.day.toString().padLeft(2, '0')}/"
                      "${pickedDate.month.toString().padLeft(2, '0')}/"
                      "${pickedDate.year.toString().substring(2)}";
                  widget.dateController.text = formattedDate;
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: AppColor.blueColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text('Time'),
        CustomDropdownListings(itemList: timeList, listType: '9:00 AM'),
        SizedBox(height: 30),
        Text('Number of person'),
        CustomDropdownListings(itemList: personNumber, listType: '1'),
        SizedBox(height: 30),
        CustomButton(buttonText: 'Book Now'),
        SizedBox(height: 30),
        Container(height: .3, width: double.infinity, color: Colors.grey),
        SizedBox(height: 30),
        Text('Contact Information'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.phone_enabled_outlined,
                color: AppColor.blueColor,
              ),
            ),
            Text(widget.number),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.email_outlined, color: AppColor.blueColor),
            ),
            Text(widget.gmail),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.language, color: AppColor.blueColor),
            ),
            Text(widget.web),
          ],
        ),
        SizedBox(height: 20),
        Container(height: .3, width: double.infinity, color: Colors.grey),
      ],
    );
  }
}
