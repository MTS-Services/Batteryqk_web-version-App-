import 'package:get/get.dart'; // add for .tr
import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/text_string.dart';
import 'package:flutter/material.dart';
import 'custom_reviews.dart';

class CustomDetails extends StatefulWidget {
  final List<String> facilities;
  final int starCount;

  const CustomDetails({
    super.key,
    required this.facilities,
    required this.starCount,
  });

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
            CustomTitleText('academies_1_title'.tr),
            Badge(
              label: Text('paid'.tr),
              backgroundColor: AppColor.whiteColor,
              textColor: Colors.black,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            ),
          ],
        ),
        Text('downtown'.tr, style: TextStyle(color: Colors.grey.shade600)),
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
            Text(
              'reviews_count'.tr,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('description'.tr),
        CustomParagraphText('academies_1_details'.tr),
        const SizedBox(height: 30),
        CustomSectionHeaderText('age_groups'.tr),
        Row(
          children: [
            Badge(
              label: Text('children_6_12'.tr),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              backgroundColor: AppColor.whiteColor,
              textColor: Colors.black,
            ),
            const SizedBox(width: 10),
            Badge(
              label: Text('teenagers_13_18'.tr),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
              backgroundColor: AppColor.whiteColor,
              textColor: Colors.black,
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('facilities'.tr),
        Column(
          children:
              widget.facilities.map((facility) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.green),
                      const SizedBox(width: 6),
                      Text(facility),
                    ],
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('opening_hours'.tr),
        CustomParagraphText('opening_hours_detail'.tr),
        const SizedBox(height: 30),
        CustomSectionHeaderText('reviews'.tr),
        CustomReviews(
          starCount: widget.starCount,
          name: 'Mark T.',
          designation: 'Excellent facilities and coaches',
        ),
        const SizedBox(height: 20),
        CustomReviews(
          starCount: widget.starCount,
          name: 'Sarah L.',
          designation: 'My kids love coming here. Very professional.',
        ),
      ],
    );
  }
}
