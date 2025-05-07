import 'package:batteryqk_web_app/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:batteryqk_web_app/features/authentication/views/book_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/features/authentication/views/login_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/welcome_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Listings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,

        inputDecorationTheme: InputDecorationTheme(
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: AppColor.appGreenColor,),
                 borderRadius: BorderRadius.circular(6),
               ),

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
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
    );
  }
}
