import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/text_string.dart';
import 'package:flutter/material.dart';
import 'custom_reviews.dart';


class CustomDetails extends StatefulWidget {
  final List facilities;
  final int starCount;

  const CustomDetails({super.key, required, required this.facilities, required this.starCount});

  @override
  State<CustomDetails> createState() => _CustomDetailsState();
}

class _CustomDetailsState extends State<CustomDetails> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitleText(AppText.academies1Title),
            Badge(
              label: Text('Paid'),
              backgroundColor: AppColor.appLightGreenColor,
              textColor: Colors.black,
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            ),
          ],
        ),
        Text('DownTown', style: TextStyle(color: Colors.grey.shade600)),
        Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.starCount, (index) {
                return const Icon(Icons.star, color: Colors.amber, size: 16);
              }),
            ),
            Text(
              ' (${widget.starCount})',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            const Text(
              ' (2 reviews)',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 30),
        CustomSectionHeaderText('Description'),
        CustomParagraphText(AppText.academies1Details),
        SizedBox(height: 30),
        CustomSectionHeaderText('Age Groups'),
        Row(
          children: [
            Badge(
              label: Text('Children (6-12 years)'),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              backgroundColor: AppColor.appLightGreenColor,
              textColor: Colors.black,
            ),
            SizedBox(width: 10),
            Badge(
              label: Text('Teenagers(13-18 years)'),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              backgroundColor: AppColor.appLightGreenColor,
              textColor: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 30),
        CustomSectionHeaderText('Facilities'),
        Column(
          children:
              widget.facilities.map((facility) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      Text(facility),
                    ],
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 30),
        CustomSectionHeaderText('Opening Hours'),
        CustomParagraphText(
          'Mon-Fri: 7:00 AM - 9:00PM, Sat-Sun: 8:00AM - 7:00PM',
        ),
        SizedBox(height: 30),
        CustomSectionHeaderText('Location'),
        Container(
          height: 250,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.appLightGreenColor,
          ),
        ),
        SizedBox(height: 30),
        CustomSectionHeaderText('Reviews'),
        CustomReviews(
          starCount: widget.starCount,
          name: 'Mark T.',
          designation: 'Excellent facilities and coaches',
        ),
        SizedBox(height: 20),
        CustomReviews(
          starCount: widget.starCount,
          name: 'Sarah L.',
          designation: 'My kids love coming here. Very professional.',
        ),
      ],
    );
  }
}
