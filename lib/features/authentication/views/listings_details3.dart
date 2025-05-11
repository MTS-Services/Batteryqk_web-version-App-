import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details_image_group.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_listings_booking_section.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';    

class ListingsDetails3 extends StatefulWidget {
  const ListingsDetails3({super.key});

  @override
  State<ListingsDetails3> createState() => _ListingsDetails3State();
}

class _ListingsDetails3State extends State<ListingsDetails3> {
  final List facilitiesList = [
    'Olympic-sized field',
    'Changing rooms',
    'Shower facilities',
    'Spectator area',
  ];

  final List contractInfos = [
    '945-624-4531',
    'info@aceclub.com',
    'www.aceclub.com',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack:true,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDetailsImageGroup(
                image1a: AppImages.academies3a,
                image1b: AppImages.academies3b,
                image1c: AppImages.academies3c,
                image1d: AppImages.academies3d,
                image1e: AppImages.academies3e,
              ),
              SizedBox(height: 20),
              CustomDetails(facilities: facilitiesList, starCount: 5),
              CustomListingsBookingSection(
                dateController: TextEditingController(),
                number: '945-624-4531',
                gmail: 'info@aceclub.com',
                web: 'www.aceclub.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
