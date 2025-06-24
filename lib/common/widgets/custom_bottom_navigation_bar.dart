import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/controllers/bottom_nav_controller.dart';
import '../../features/authentication/views/HomeScreen/home_screen.dart';
import '../../features/authentication/views/ListingScreen/listings.dart';
import '../../features/authentication/views/profile_screen.dart';
import '../../util/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final BottomNavController bottomNavController = Get.put(BottomNavController());

  final List<Widget> _pages = [
    HomeScreen(),
    const Listings(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[bottomNavController.currentIndex.value],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_filled, 'home'.tr, 0),
                _buildNavItem(Icons.work_outline, 'jobs'.tr, 1),
                _buildNavItem(Icons.menu, 'menu'.tr, 2),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Expanded(
      child: Obx(() {
        final isSelected = bottomNavController.currentIndex.value == index;

        return InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => bottomNavController.changeTabIndex(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.blueColor.withOpacity(0.1) : null,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 26,
                  color: isSelected ? AppColor.blueColor : AppColor.orangeColor,
                ),
                const SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColor.blueColor : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
