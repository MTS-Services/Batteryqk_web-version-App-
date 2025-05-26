import 'package:get/get.dart'; // add for .tr
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_details_image_group.dart';
import 'package:batteryqk_web_app/common/widgets/listings_details_custom/custom_listings_booking_section.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';

import '../../../util/colors.dart';

class ListingsDetails extends StatefulWidget {
  const ListingsDetails({super.key});

  @override
  State<ListingsDetails> createState() => _ListingsDetailsState();
}

class _ListingsDetailsState extends State<ListingsDetails> {
  late final List<String> facilitiesList;
  final List<String> contractInfos = [
    '555-123-4567',
    'info@eliteswimmingacademy.com',
    'www.eliteswimmingacademy.com',
  ];

  @override
  void initState() {
    super.initState();
    facilitiesList = [
      'olympic_pool'.tr,
      'changing_rooms'.tr,
      'shower_facilities'.tr,
      'spectator_area'.tr,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: true),
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
              const SizedBox(height: 20),
              CustomDetails(facilities: facilitiesList, starCount: 5, tag: 'Paid'.tr,),

              CustomListingsBookingSection(
                dateController: TextEditingController(),
                number: contractInfos[0],
                gmail: contractInfos[1],
                web: contractInfos[2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
