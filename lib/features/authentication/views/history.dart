import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/booking_container.dart';
import '../controllers/booking_history_controller.dart';
import '../controllers/icon_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final TextEditingController reviewController = TextEditingController();
  final iconController = Get.put(IconController());
  final BookingHistoryController bookingController = Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
        body: Obx(() {
          final bookingList = bookingController.bookingList;
          if (bookingList.isEmpty) {
            return const Center(child: Text('No bookings found.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: bookingList.length,
            itemBuilder: (context, index) {
              final booking = bookingList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: BookingContainer(
                  reviewController: reviewController,
                  academyName: booking.listing?.name ?? "N/A",
                  categories: booking.reward?.category?? "N/A",
                  location: booking.listing!.location.toString()?? "N/A",
                  date: booking.bookingDate.toString() ?? "N/A",
                  description: booking.listing?.description ?? "N/A",
                  numOfStar: '${iconController.selectedIndex.value}',
                  bookingNumber: '${booking.numberOfPersons ?? index + 1}',
                  bookingId: booking.id.toString(),
                ),
              );
            },
          );
        })

    );
  }
}
