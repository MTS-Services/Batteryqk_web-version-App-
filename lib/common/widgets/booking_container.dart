import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../styles/styles.dart';
import 'custom_review_icon.dart';
import 'icon_text_button.dart';
import 'review_dialog.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer({
    super.key,
    required this.reviewController,
    required this.academyName,
    required this.categories,
    required this.location,
    required this.date,
    required this.description,
    required this.numOfStar,
    required this.bookingNumber,
    required this.bookingId,
  });

  final TextEditingController reviewController;
  final String academyName;
  final String categories;
  final String location;
  final String date;
  final String description;
  final String numOfStar;
  final String bookingNumber;
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(1, -1),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeaderText(academyName),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Categories"),
          CustomSectionSubtitleText(subtitle: categories),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Loaction"),
          CustomSectionSubtitleText(subtitle: location),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Date:"),
          CustomSectionSubtitleText(subtitle: date),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Academy Ratings:"),
          CustomReviewIcons(
            showText: true,
            numOfStar: numOfStar,
            tappable: false,
          ),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "  "),
          CustomSectionSubtitleText(subtitle: description),
          const SizedBox(height: 18),
          IconTextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ReviewDialog(
                    reviewController: reviewController,
                    academyName: academyName,
                    bookingId: bookingId,
                  );
                },
              );
            },
            showIcon: true,
            text: 'Write Review',
          ),
          const SizedBox(height: 18),
          Divider(thickness: 1, color: Colors.grey.shade300),
          const SizedBox(height: 18),
          Text(
            'Booking #$bookingNumber',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
