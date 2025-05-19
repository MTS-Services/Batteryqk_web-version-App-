import 'package:batteryqk_web_app/common/widgets/calender_screen.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/common/widgets/custom_text_field.dart';
import 'package:batteryqk_web_app/common/widgets/multi_dropdown.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                        Text(
                          'personal_information'.tr,
                          style: const TextStyle(
                            color: Color(0xFF1F2937),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          'first_name'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const CustomTextField(),
                        const SizedBox(height: 10),

                        Text(
                          'last_name'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const CustomTextField(),

                        const SizedBox(height: 10),

                        Text(
                          'email_address'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const CustomTextField(),

                        const SizedBox(height: 10),

                        Text(
                          'password'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const CustomTextField(),
                        const SizedBox(height: 10),

                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
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

                        const SizedBox(height: 3),
                        Text(
                          'number_of_participants'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 3,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: TextFormField(),
                          ),
                        ),
                        const SizedBox(height: 3),
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
