import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/review_service.dart';
import '../../util/colors.dart';
import '../styles/styles.dart';
import 'custom_review_icon.dart';
import 'icon_text_button.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({
    super.key,
    required this.academyName,
    required this.bookingId,
    required this.reviewController,
  });

  final String academyName;
  final String bookingId;
  final TextEditingController reviewController;

  @override
  Widget build(BuildContext context) {
    final ReviewController reviewCtrl = Get.find<ReviewController>();

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
                onPressed: () {},
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                text:
                    reviewCtrl.isLoading.value
                        ? 'Submitting...'
                        : 'Submit Review',
              ),

              SizedBox(height: 10.h),

              /// Cancel Button
              IconTextButton(
                onPressed: () => Navigator.pop(context),
                text: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
