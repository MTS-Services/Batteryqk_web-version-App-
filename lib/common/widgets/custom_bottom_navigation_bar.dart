import 'package:batteryqk_web_app/features/authentication/views/home_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currenIndex = 0;
  List pageLink = [
    HomeScreen(),
    Container(color: Colors.yellow),
    Container(color: Colors.green),
    Container(color: Colors.green),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageLink[_currenIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 32,
          selectedFontSize: 16,
          selectedIconTheme: IconThemeData(
          ),
          currentIndex: _currenIndex,
          selectedItemColor: AppColor.appGreenColor,
          onTap: (index){
            setState(() {
              _currenIndex = index;
            });
          },
          items: const [
BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: 'Home'),
BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined),label: 'Listings'),
BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: 'Book'),
BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined),label: 'Manu'),
      ]),
    );
  }
}
