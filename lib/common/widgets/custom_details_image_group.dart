import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';

class CustomDetailsImageGroup extends StatelessWidget {
  const CustomDetailsImageGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            width: 300,
            child: Image.asset(AppImages.academies1a)),
      ],
    );
  }
}
