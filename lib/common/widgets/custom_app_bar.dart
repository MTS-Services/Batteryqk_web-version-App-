import 'package:batteryqk_web_app/util/colors.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  bool? isBack = false;

  CustomAppBar({super.key , this.isBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBack!,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      elevation: 1,
      titleSpacing: 4,
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Image.asset(AppImages.logo,height: 100, width: 60,),
            Text(
              'Batteriqk',
              style: GoogleFonts.openSans(
                letterSpacing: 1.2,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: AppColor.blackColor,
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black87),
              onPressed: () {
                // Handle notification tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
