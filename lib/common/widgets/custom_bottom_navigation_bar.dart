import 'package:batteryqk_web_app/features/authentication/views/home_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/menu_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

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
    const ColoredBox(color: Colors.yellow),
    const ColoredBox(color: Colors.green),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.appGreenColor,
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 14,
          unselectedFontSize: 13,
          showUnselectedLabels: true,
          elevation: 1,
          iconSize: 26,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Listings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
