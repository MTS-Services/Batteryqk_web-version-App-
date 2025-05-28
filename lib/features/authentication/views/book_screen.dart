import 'package:batteryqk_web_app/common/widgets/calender_screen.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/common/widgets/custom_text_field.dart';
import 'package:batteryqk_web_app/common/widgets/multi_dropdown.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/custom_dropdown_Listings.dart';
import '../../../common/widgets/terms_and_booking_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String? selectedAgeGroup;

  bool isChecked = true;

  final List<String> ageGroups = [
    'Toddlers(0-5 years',
    'Children(6-12 years',
    'Teenagers(13-18 years',
    'Adults(18+',
  ];

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


  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat('MM/dd/yyyy');

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (datePicked != null && datePicked != _selectedDate) {
      setState(() {
        _selectedDate = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: const CustomAppBar(isBack: false),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 20,
          bottom: 20,
        ),
        child: Card(
          elevation: 0.5,
          shadowColor: Colors.white.withOpacity(0.5),
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'book_a_session'.tr,
                      style: const TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          'booking_details'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('select_academy'.tr),
                        const SizedBox(height: 3),
                        MultiDropDown(),
                        const SizedBox(height: 3),
                        Text(
                          'date'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 3,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 9,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CalenderScreen(
                                selectedDate: _selectedDate,
                                formatter: _formatter,
                              ),
                            ),
                          ),
                        ),

                        Text('time'.tr),
                        CustomDropdownListings(itemList: timeList, listType: '9:00 AM'),
                        const SizedBox(height: 8),
                        Text('number_of_person'.tr),
                        CustomDropdownListings(itemList: personNumber, listType: '1'),
                        const SizedBox(height: 8),
                        Text(
                          'age_group'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomDropdownButton(
                          itemList: ageGroups,
                          listType: 'select_an_age_group'.tr,
                        ),

                        const SizedBox(height: 10),

                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Text(
                          'special_request'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'additional_request'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 0.5,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(),
                            child: TextFormField(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),

                        TermsAndBookingCard(onCancel: () {}, onSubmit: () {}),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
