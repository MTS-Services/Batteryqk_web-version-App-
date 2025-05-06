import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_text_field.dart';
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

  final List<String> ageGroups=[
    'Toddlers(0-5 years',
    'Children(6-12 years',
    'Teenagers(13-18 years',
    'Adults(18+'
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 20,bottom: 20),
        child: Card(
          elevation: 1,
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
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                        CustomTextField(),
                        const SizedBox(height: 10),
                      
                        Text('Last Name',style: Theme.of(context).textTheme.bodyMedium,),
                        CustomTextField(),
                      
                        const SizedBox(height: 10),
                      
                        Text('Email Address',style: Theme.of(context).textTheme.bodyMedium,),
                        CustomTextField(),
                      
                        const SizedBox(height: 10),
                      
                        Text('Password',style: Theme.of(context).textTheme.bodyMedium,),
                        CustomTextField(),
                        const SizedBox(height: 10),
                      
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Text('Booking Details',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFF1F2937)),),
                        const SizedBox(height: 10),
                        Text('Select Academy'),
                        const SizedBox(height: 3),
                      
                        Card(
                          color: Colors.white,
                      
                          child: DropdownButtonFormField<String>(
                            // padding: EdgeInsets.symmetric(vertical: 8),
                            isExpanded: true,
                            value: selectedAcademy,
                            decoration: InputDecoration(
                              hintText: 'Select an academy',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                            ),
                            items:
                                academies.map((academy) {
                                  return DropdownMenuItem<String>(
                                    value: academy,
                                    child: Text(
                                      academy,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedAcademy = value;
                              });
                            },
                          ),
                        ),
                      
                        Text('Category',style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 3),
                      
                        Card(
                          color: Colors.white,
                      
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            value: selectedCategory,
                            decoration: InputDecoration(
                              hintText: 'Select an academy',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                            ),
                            items:
                                categories.map((academy) {
                                  return DropdownMenuItem<String>(
                                    value: academy,
                                    child: Text(
                                      academy,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text('Date',style: Theme.of(context).textTheme.bodyMedium,),
                        Card(
                      
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                              decoration: BoxDecoration(
                      
                      
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
                                      color: _selectedDate == null ? Colors.black54 : Colors.black54,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.calendar_today, color: Colors.grey[700]),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text('Number of Participants',style: Theme.of(context).textTheme.bodyMedium,),
                        Card(
                          color: Colors.white,
                          child: Container(
                            height: 47,
                            decoration: BoxDecoration(
                      
                            ),
                              child: TextFormField(
                              )),
                        ),
                        const SizedBox(height: 3),
                        Text('Age Group',style: Theme.of(context).textTheme.bodyMedium,),
                        Card(
                          color: Colors.white,
                      
                          child: DropdownButtonFormField<String>(
                            // padding: EdgeInsets.symmetric(vertical: 8),
                            isExpanded: true,
                            value: selectedAgeGroup,
                            decoration: InputDecoration(
                              hintText: 'Select an age group',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                            ),
                            items:
                            ageGroups.map((academy) {
                              return DropdownMenuItem<String>(
                                value: academy,
                                child: Text(
                                  academy,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedAgeGroup = value;
                              });
                            },
                          ),
                        ),
                      
                        const SizedBox(height: 10),
                      
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        Text('Special Request',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFF1F2937))),
                        const SizedBox(height: 25),
                        Text('Additional Request',style: Theme.of(context).textTheme.bodyMedium),
                        Card(
                          color: Colors.white,
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(

                              ),
                              child: TextFormField(
                              )),
                        ),
                        const SizedBox(height: 10),

                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 10),

                        Container(
                          width: double.infinity,
                          //padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
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
                                    padding:  EdgeInsets.only(top: 10),
                                    child: Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: 'I agree to the terms and conditions\n',
                                            style: Theme.of(context).textTheme.bodyMedium),

                                            TextSpan(
                                              text: 'By booking a session, you agree to our\n ',style: TextStyle(color: Color(0xFF6B7280),fontSize: 14,fontWeight: FontWeight.w400),
                                            ),

                                            TextSpan(
                                              text: 'Terms of Service',
                                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {

                                                },
                                            ),
                                            TextSpan(text: ' and ',style: TextStyle(color: Color(0xFF6B7280),fontSize: 14,fontWeight: FontWeight.w400)),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                },
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
                                      print('Cancel pressed',);
                                    },
                                    child: Text('Cancel',style: Theme.of(context).textTheme.bodyMedium,),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: isChecked
                                        ? () {
                                      print('Submit Booking pressed');
                                    }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF26B3FF),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text('Submit Booking',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
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

