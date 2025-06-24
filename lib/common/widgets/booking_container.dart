import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../styles/styles.dart';
import 'icon_text_button.dart';
import 'review_dialog.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer({
    super.key,
    required this.reviewController,
    required this.academyName,
    required this.location,
    required this.date,
    required this.additionalNote,
    required this.description,
    required this.numOfStar,
    required this.bookingNumber,
    required this.bookingId,
    required this.bookingTime,
    required this.reviewIdStatus,
    required this.status,
    required this.averageRating,
  });

  final TextEditingController reviewController;
  final String academyName;
  final String location;
  final String date;
  final String description;
  final String numOfStar;
  final String bookingNumber;
  final String bookingId;
  final String bookingTime;
  final String additionalNote;
  final String reviewIdStatus;
  final String status;

  final double averageRating;
  List<Widget> _buildStars() {
    List<Widget> stars = [];
    int fullStars =
        averageRating.floor(); // Full stars based on the integer part
    bool hasHalfStar =
        (averageRating - fullStars) >= 0.5; // Check if half-star is needed

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber, size: 25));
    }

    // Add half star if necessary
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 25));
    }

    // Add empty stars for the remaining part
    int emptyStars = 5 - stars.length; // Make sure to have 5 stars total
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 25));
    }

    return stars;
  }

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
          BoxShadow(color: Colors.grey.shade200, offset: const Offset(-1, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeaderText(academyName),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Loaction"),
          CustomSectionSubtitleText(subtitle: location),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Booking Date:"),
          CustomSectionSubtitleText(subtitle: date),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: 'Booking Time:'),
          CustomSectionSubtitleText(subtitle: bookingTime),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: 'Additional Note:'),
          CustomSectionSubtitleText(subtitle: additionalNote),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Ratings:"),
          if (reviewIdStatus != 'null' && status == 'ACCEPTED')
            Row(children: _buildStars()),
          const SizedBox(height: 18),
          CustomSectionTitleText(title: "Description"),
          CustomSectionSubtitleText(subtitle: description),
          const SizedBox(height: 18),
          if (reviewIdStatus == 'null')
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
          if (reviewIdStatus != 'null' && status != 'ACCEPTED')
            CustomSectionTitleText(title: 'Review In Pending'),

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
