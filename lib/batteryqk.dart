import 'package:batteryqk_web_app/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:flutter/material.dart';

class Batteryqk extends StatelessWidget {
  const Batteryqk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomBottomNavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}