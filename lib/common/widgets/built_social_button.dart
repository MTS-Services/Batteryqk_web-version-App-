import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildSocialButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColor.blueColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: FaIcon(icon, color: Colors.white)),
    ),
  );
}
