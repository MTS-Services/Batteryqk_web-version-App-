import 'package:batteryqk_web_app/data/services/api_services.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/icon_controller.dart';
import 'package:batteryqk_web_app/features/authentication/controllers/review_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/booking_history_controller.dart';
import '../../util/colors.dart';
import '../styles/styles.dart';
import 'custom_review_icon.dart';
import 'icon_text_button.dart';
import 'show_snack_bar.dart';

class ReviewDialog extends StatelessWidget {
  ReviewDialog({
    super.key,
    required this.academyName,
    required this.bookingId,
    required this.reviewController,
  });

  final String academyName;
  final int bookingId;
  final TextEditingController reviewController;

  final ReviewController reviewCtrl = Get.put(ReviewController());
  final IconController iconController = Get.find<IconController>();
  final ApiService apiServices = ApiService();
  final BookingHistoryController bookingController =
      Get.find<BookingHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: const CustomTitleText('Write a Review')),
              SizedBox(height: 10.h),
              Center(child: CustomSectionTitleText(title: academyName)),
              Center(
                child: const CustomSectionSubtitleText(
                  subtitle: 'Share your experience with this academy',
                ),
              ),
              SizedBox(height: 10.h),

              const CustomSectionHeaderText('Rating'),
              CustomReviewIcons(tappable: true),
              SizedBox(height: 10.h),

              const CustomSectionHeaderText('Your Review'),
              SizedBox(height: 10.h),
              TextField(
                controller: reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Tell others about your experience...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              /// Submit Button
              IconTextButton(
                onPressed: () {
                  if (reviewController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Review cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (iconController.selectedIndex.value == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Rating cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Submit the review
                    apiServices
                        .sendReview(
                          bookingId,
                          iconController.selectedIndex.value,
                          reviewController.text,
                        )
                        .then((_) {
                          // Show success message on successful submission
                          showSnackbar(context, 'Success', 'Review submitted');

                          // Call fetchBooking() to refresh data
                          bookingController.fetchBooking();

                          // Clear the form and reset the state
                          iconController.selectedIndex.value = 0;
                          reviewController.clear();
                          Navigator.pop(context);
                        })
                        .catchError((error) {
                          // Handle any error if the submission fails
                          showSnackbar(
                            context,
                            'Error',
                            'Failed to submit review: $error',
                          );
                        });
                  }
                },
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                text: 'Submit Review',
              ),

              SizedBox(height: 10.h),

              /// Cancel Button
              IconTextButton(
                onPressed: () {
                  iconController.selectedIndex.value = 0;
                  reviewController.clear();
                  Navigator.pop(context);
                },
                text: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
