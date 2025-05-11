import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBack;

  CustomAppBar({super.key, this.isBack = false});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        color: Colors.white, // ✅ Force solid white background
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (isBack)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                if (!isBack) const SizedBox(width: 0),
                Image.asset(AppImages.logo, height: 50, width: 65),
                const SizedBox(width: 5),
                Text(
                  'Batteriqk',
                  style: GoogleFonts.openSans(
                    letterSpacing: 1.2,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppColor.blackColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black87,
                    size: 26,
                  ),
                  onPressed: () {
                    // TODO: Handle notification click
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
