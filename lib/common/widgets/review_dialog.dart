import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/colors.dart';
import '../styles/styles.dart';
import 'custom_review_icon.dart';
import 'icon_text_button.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({
    super.key,
    required this.reviewController,
    required this.academyName,
  });

  final TextEditingController reviewController;

  final String academyName;

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
            children: [
              CustomTitleText('Write a Review'),
              SizedBox(height: 10.h),
              CustomSectionTitleText(title: academyName),
              CustomSectionSubtitleText(
                subtitle: 'Share your experience with this accademy',
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSectionHeaderText('Rating'),
                  CustomReviewIcons(),
                  SizedBox(height: 10.h),
                  CustomSectionHeaderText('Your Review'),
                ],
              ),

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
              IconTextButton(
                onPressed: () {},
                backgroundColor: Colors.blue,
                textColor: AppColor.whiteColor,
                text: 'Submit Review',
              ),
              SizedBox(height: 10.h),
              IconTextButton(
                onPressed: () {
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
