import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/features/admin/edit_dialog_box.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_dropdown_listings.dart';
import '../../../common/widgets/terms_and_booking_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.listingId, required this.openingHours});

  final int listingId;
  final String openingHours;

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String? selectedAgeGroup;

  bool isChecked = true;
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
  final _dateController = TextEditingController();
  final _requestController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _requestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.openingHours);
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
                        Text('date'.tr),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.blueColor),
                            ),
                            labelText: 'date_month_year'.tr,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  initialDate: _selectedDate ?? DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  _selectedDate = pickedDate;
                                  final formattedDate =
                                      "${pickedDate.day.toString().padLeft(2, '0')}/"
                                      "${pickedDate.month.toString().padLeft(2, '0')}/"
                                      "${pickedDate.year.toString().substring(2)}";
                                  _dateController.text = formattedDate;
                                }
                              },
                              icon: Icon(
                                Icons.calendar_today_outlined,
                                color: AppColor.blueColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text('time'.tr),
                        CustomDropdownListings(
                          itemList: timeList,
                          listType: '9:00 AM',
                        ),
                        const SizedBox(height: 30),
                        Text('number_of_person'.tr),
                        CustomDropdownListings(
                          itemList: personNumber,
                          listType: '1',
                        ),
                        Text(
                          'additional_request'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextField(
                          controller: _requestController,
                          label: '',
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
