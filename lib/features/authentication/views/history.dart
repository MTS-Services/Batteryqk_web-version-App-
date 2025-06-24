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
  final BookingHistoryController bookingController = Get.put(
    BookingHistoryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Obx(() {
        final bookingList = bookingController.bookingList;
        if (bookingController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (bookingList.isEmpty) {
          return const Center(child: Text('No bookings found.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemCount: bookingList.length,
          itemBuilder: (context, index) {
            final booking = bookingList[index];
            print(booking.ratings);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: BookingContainer(
                reviewController: reviewController,
                academyName: booking.listing?.name ?? "N/A",
                location: booking.listing!.location.toString(),
                date: booking.bookingDate.toString(),
                additionalNote: booking.additionalNote.toString(),
                bookingTime: booking.bookingHours.toString(),
                description: booking.listing?.description ?? "N/A",
                numOfStar: '${iconController.selectedIndex.value}',
                bookingNumber: '${booking.numberOfPersons ?? index + 1}',
                bookingId: booking.id.toString(),
                reviewIdStatus: booking.reviewId.toString(),
                status: booking.status.toString(),
                averageRating: booking.ratings ?? 0.0,
              ),
            );
          },
        );
      }),
    );
  }
}
