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
  });

  final TextEditingController reviewController;
  final String academyName;
  final String categories;
  final String location;
  final String date;
  final String description;

  final String numOfStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(1, -1),
            blurRadius: 5,
          ),
          BoxShadow(color: Colors.grey.shade200, offset: Offset(-1, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeaderText(academyName),
          SizedBox(height: 18),
          CustomSectionTitleText(title: "Categories"),
          CustomSectionSubtitleText(subtitle: categories),
          SizedBox(height: 18),
          CustomSectionTitleText(title: "Loaction"),
          CustomSectionSubtitleText(subtitle: location),
          SizedBox(height: 18),
          CustomSectionTitleText(title: "Date:"),
          CustomSectionSubtitleText(subtitle: date),
          SizedBox(height: 18),
          CustomSectionTitleText(title: "Academy Ratings:"),
          CustomReviewIcons(
            showText: true,
            numOfStar: numOfStar,
            tappable: false   ,
          ),
          SizedBox(height: 18),
          CustomSectionTitleText(title: "Description"),
          CustomSectionSubtitleText(subtitle: description),
          SizedBox(height: 18),
          IconTextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ReviewDialog(
                    reviewController: reviewController,
                    academyName: academyName,
                  );
                },
              );
            },
            showIcon: true,
            text: 'Write Review',
          ),
          SizedBox(height: 18),
          Divider(thickness: 1, color: Colors.grey.shade300),
          SizedBox(height: 18),
          Text(
            'Booking #7',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
