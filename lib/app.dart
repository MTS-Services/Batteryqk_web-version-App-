import 'package:batteryqk_web_app/features/admin/admin_panel.dart';
import 'package:batteryqk_web_app/features/admin/listings_tab.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/views/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          canvasColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:AppColor.blueColor),
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
