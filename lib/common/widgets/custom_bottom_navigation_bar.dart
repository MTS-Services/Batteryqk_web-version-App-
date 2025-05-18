import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:batteryqk_web_app/features/authentication/views/book_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/home_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/features/authentication/views/menu_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Listings(),
    const BookScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 24, right: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_filled, 0),
                  _buildNavItem(Icons.work_outline, 1),
                  _buildNavItem(Icons.calendar_today_outlined, 2),
                  _buildNavItem(Icons.person, 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected
                  ? const Color.fromARGB(255, 255, 255, 255).withOpacity(0.15)
                  : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 30,
          color:
              isSelected
                  ? AppColor.blueColor
                  : const Color.fromARGB(255, 65, 65, 65),
        ),
      ),
    );
  }
}
