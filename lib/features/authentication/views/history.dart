import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package

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

  Future<void> _refreshData() async {
    await bookingController.fetchBooking();
  }

  // Helper method to format the booking date
  String _formatBookingDate(DateTime bookingDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(bookingDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBack: true),
      body: Obx(() {
        final bookingList = bookingController.bookingList;
        if (bookingController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (bookingList.isEmpty) {
          return Center(child: Text('no_booking_found'.tr));
        }
        return RefreshIndicator(
          onRefresh: _refreshData, // Refresh data on pull-to-refresh
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: bookingList.length,
            itemBuilder: (context, index) {
              final booking = bookingList[index];

              String formattedDate = _formatBookingDate(booking.bookingDate!);

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: BookingContainer(
                  reviewController: reviewController,
                  academyName: booking.listing?.name ?? "N/A",
                  location: booking.listing!.location.toString().substring(
                    1,
                    booking.listing!.location.toString().length - 1,
                  ),
                  date: formattedDate, // Pass the formatted date
                  additionalNote: booking.additionalNote.toString(),
                  bookingTime: booking.bookingHours.toString(),
                  description: booking.listing?.description ?? "N/A",
                  numOfStar: '${iconController.selectedIndex.value}',
                  bookingNumber: '${booking.numberOfPersons ?? index + 1}',
                  bookingId: booking.id,
                  reviewIdStatus: booking.reviewId.toString(),
                  status: booking.status.toString(),
                  averageRating: booking.ratings ?? 0.0,
                  paymentMethod: booking.paymentMethod.toString(),
                  reviewStatus: booking.reviewStatus.toString(),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
