import 'package:batteryqk_web_app/common/styles/styles.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/text_string.dart';
import 'package:flutter/material.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    int starCount = 5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitleText(AppText.academies1Title),
            Badge(label: Text('Paid'),
            backgroundColor: AppColor.appLightGreenColor,
            textColor: Colors.black,
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12
              ),
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),

            )

          ],
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Downtown',style: TextStyle(color: Colors.grey.shade600),)),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(starCount, (index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    );
                  }),
                ),
                Text(
                  ' ($starCount)',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 4),
                const Text(
                  ' (2 reviews)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 40),
            CustomSectionHeaderText('Description'),
            CustomParagraphText(AppText.academies1Details),
            SizedBox(height: 20),
            CustomSectionHeaderText('Age Groups'),
            Row(
              children: [
                Badge(label: Text('Children (6-12 years)'),
                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 16),
                backgroundColor: AppColor.appLightGreenColor,
                textColor: Colors.black),
                SizedBox(width:  10,),
                Badge(label: Text('Teenagers(13-18 years)'),
                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 16),
                  backgroundColor: AppColor.appLightGreenColor,
                  textColor: Colors.black),
              ],
            ),
            SizedBox(height: 20),
            CustomSectionHeaderText('Facilities'),



          ],
        )
      ],
    );
  }
}
