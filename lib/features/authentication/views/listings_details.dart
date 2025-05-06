import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details_image_group.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_listings_booking_section.dart';
import 'package:flutter/material.dart';

class ListingsDetails extends StatefulWidget {
  const ListingsDetails({super.key});

  @override
  State<ListingsDetails> createState() => _ListingsDetailsState();
}

class _ListingsDetailsState extends State<ListingsDetails> {
  final List facilitiesList = [
    'Olympic-sized pool',
    'Changing rooms',
    'Shower facilities',
    'Spectator area',
  ];

  final List contractInfos = [
    '555-123-4567',
    'info@eliteswimmingacademy.com',
    'www.eliteswimmingacademy.com'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
    child: CustomAppBar(),
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDetailsImageGroup(),
              SizedBox(height: 20),
              CustomDetails(facilities: facilitiesList, starCount: 5),
              CustomListingsBookingSection(dateController: TextEditingController(),),
            ],
          ),
        ),
      ),
    );
  }
}
