import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details_image_group.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_listings_booking_section.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/custom_bottom_navigation_bar.dart';

class ListingsDetails1 extends StatefulWidget {
  const ListingsDetails1({super.key});

  @override
  State<ListingsDetails1> createState() => _ListingsDetails1State();
}

class _ListingsDetails1State extends State<ListingsDetails1> {
  final List facilitiesList = [
    'Olympic-sized pool',
    'Changing rooms',
    'Shower facilities',
    'Spectator area',
  ];

  final List contractInfos = [
    '555-123-4567',
    'info@eliteswimmingacademy.com',
    'www.eliteswimmingacademy.com',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: true,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDetailsImageGroup(
                image1a: AppImages.academies1a,
                image1b: AppImages.academies1b,
                image1c: AppImages.academies1c,
                image1d: AppImages.academies1d,
                image1e: AppImages.academies1e,
              ),
              SizedBox(height: 20),
              CustomDetails(facilities: facilitiesList, starCount: 5),
              CustomListingsBookingSection(
                dateController: TextEditingController(),
                number: '555-123-4567',
                gmail: 'info@eliteswimmingacademy.com',
                web: 'www.eliteswimmingacademy.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
