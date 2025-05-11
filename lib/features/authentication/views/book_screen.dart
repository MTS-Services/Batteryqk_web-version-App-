import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/common/widgets/custom_text_field.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String? selectedAcademy;
  String? selectedCategory;
  String? selectedAgeGroup;

  bool isChecked = true;

  final List<String> academies = [
    'Elite Swimming Academy',
    'Champions Football Academy',
    'Little Stars Nursery',
    'Hoops Basketball Center',
    'Ace Tennis Club',
    'Bright Beginnings Nursery',
  ];

  final List<String> categories = [
    'Swimming',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Cricket',
    'Gymnastics',
    'Other',
  ];

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
        child: CustomAppBar(isBack: true,),
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
                      'Book a Session',
                      style: TextStyle(
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
                          'Personal Information',
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          'First Name',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextField(),
                        const SizedBox(height: 10),

                        Text(
                          'Last Name',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextField(),

                        const SizedBox(height: 10),

                        Text(
                          'Email Address',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextField(),

                        const SizedBox(height: 10),

                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextField(),
                        const SizedBox(height: 10),

                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Text(
                          'Booking Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Select Academy'),
                        const SizedBox(height: 3),
                        CustomDropdownButton(
                          itemList: academies,
                          listType: 'Select an academy',
                        ),

                        Text(
                          'Category',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 3),
                        CustomDropdownButton(
                          itemList: categories,
                          listType: 'Select a category',
                        ),

                        const SizedBox(height: 3),
                        Text(
                          'Date',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 3,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 9,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  // Space between icon and date
                                  Text(
                                    _selectedDate == null
                                        ? 'mm/dd/yyyy'
                                        : _formatter.format(_selectedDate!),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          _selectedDate == null
                                              ? Colors.black54
                                              : Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey[700],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 3),
                        Text(
                          'Number of Participants',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 3,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.06),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 6),
                                )
                              ]
                            ),
                            child: TextFormField(),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Age Group',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomDropdownButton(
                          itemList: ageGroups,
                          listType: 'Selected an age group',
                        ),

                        const SizedBox(height: 10),

                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Text(
                          'Special Request',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Additional Request',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Card(
                          elevation: 0.5,
                          shadowColor: Colors.white.withOpacity(0.5),
                          color: Colors.white,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(),
                            child: TextFormField(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          //padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'I agree to the terms and conditions\n',
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.bodyMedium,
                                            ),

                                            TextSpan(
                                              text:
                                                  'By booking a session, you agree to our\n ',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                            TextSpan(
                                              text: 'Terms of Service',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                              recognizer:
                                                  TapGestureRecognizer()
                                                    ..onTap = () {},
                                            ),
                                            TextSpan(
                                              text: ' and ',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                              recognizer:
                                                  TapGestureRecognizer()
                                                    ..onTap = () {},
                                            ),
                                            TextSpan(text: '.'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),

                              Row(
                                children: [
                                  Spacer(),
                                  OutlinedButton(
                                    onPressed: () {
                                      print('Cancel pressed');
                                    }, style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColor.blueColor
                                  ),
                                    child: Text(
                                      'Cancel',
                                      style:TextStyle(
                                        color:Colors.white,fontWeight: FontWeight.w500,fontSize: 14
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed:
                                        isChecked
                                            ? () {
                                              print('Submit Booking pressed');
                                            }
                                            : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.orangeColor,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      'Submit Booking',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            ],
                          ),
                        ),
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
