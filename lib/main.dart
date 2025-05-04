
import 'package:batteryqk_web_app/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';


import 'package:batteryqk_web_app/features/authentication/views/book_screen.dart';

import 'package:batteryqk_web_app/common/widgets/custom_bottom_navigation_bar.dart';

import 'package:batteryqk_web_app/features/authentication/views/points.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BookScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(1),
          ),

        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF374151),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ),

      title: 'Batteryqk',

      home: Listings(),

      home: CustomBottomNavigationBar(),

      debugShowCheckedModeBanner: false,

    );
  }
}
