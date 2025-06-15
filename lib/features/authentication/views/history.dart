import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/booking_container.dart';
import '../controllers/icon_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final iconController = Get.put(IconController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTitleText('Bookings History'),
              const SizedBox(height: 20),
              for (int i = 0; i < 5; i++)
                Obx(
                  () => BookingContainer(
                    reviewController: reviewController,
                    academyName: "Ellite Swimming Academy",
                    categories: "Swimming",
                    location: 'Downtown',
                    date: '25-01-2025 at 10:00 AM',
                    description: 'All the Description will be here',
                    numOfStar: '${iconController.selectedIndex.value + 1}',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
