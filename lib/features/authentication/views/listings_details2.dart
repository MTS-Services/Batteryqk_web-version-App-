import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details_image_group.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_listings_booking_section.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingsDetails2 extends StatefulWidget {
  const ListingsDetails2({super.key});

  @override
  State<ListingsDetails2> createState() => _ListingsDetails2State();
}

class _ListingsDetails2State extends State<ListingsDetails2> {
  final List facilitiesList = [
    'Olympic-sized Gym',
    'Changing rooms',
    'Shower facilities',
    'Spectator area',
  ];

  final List contractInfos = [
    '268-594-9453',
    'info@gymcenter.com',
    'www.gymcenter.com',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDetailsImageGroup(
                image1a: AppImages.academies2a,
                image1b: AppImages.academies2b,
                image1c: AppImages.academies2c,
                image1d: AppImages.academies2d,
                image1e: AppImages.academies2e,
              ),
              SizedBox(height: 20),
              CustomDetails(facilities: facilitiesList, starCount: 5),
              CustomListingsBookingSection(
                dateController: TextEditingController(),
                number: '268-594-9453',
                gmail: 'info@gymcenter.com',
                web: 'www.gymcenter.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
