import 'package:batteryqk_web_app/features/authentication/views/review_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // add for .tr
import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'custom_reviews.dart';

class CustomDetails extends StatelessWidget {
  final String name;
  final String location;
  final String description;
  final int starCount;
  final String tag;
  final String ageGroup;
  final String facility;
  final List<String> categories;

  const CustomDetails({
    super.key,
    required this.starCount,
    required this.tag,
    required this.name,
    required this.location,
    required this.description,
    required this.ageGroup,
    required this.facility,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitleText(name),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color:
                    tag == "Paid".tr
                        ? Colors.blue.shade100
                        : Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(location, style: TextStyle(color: Colors.grey.shade600)),
        Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(starCount, (index) {
                return const Icon(Icons.star, color: Colors.amber, size: 16);
              }),
            ),
            Text(
              ' ($starCount)',
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
        CustomParagraphText(description),
        const SizedBox(height: 30),
        CustomSectionHeaderText('age_groups'.tr),
        Badge(
          label: Text(ageGroup, style: TextStyle(fontSize: 14.sp)),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          backgroundColor: AppColor.whiteColor,
          textColor: Colors.black,
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('all_sports'.tr),
        Column(
          children: [
            ...List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_box, color: Colors.green),
                    const SizedBox(width: 6),
                    Text(categories[index]),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('facilities'.tr),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: [const SizedBox(width: 6), Text(facility)]),
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomSectionHeaderText('opening_hours'.tr),
        CustomParagraphText('opening_hours_detail'.tr),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSectionHeaderText('reviews'.tr),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewScreen()),
                );
              },
              child: Text(
                "view_all".tr,
                style: TextStyle(
                  color: AppColor.blueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomReviews(
                starCount: starCount,
                name: 'Mark T.',
                designation: 'Excellent facilities and coaches',
              ),
            );
          },
        ),
      ],
    );
  }
}
