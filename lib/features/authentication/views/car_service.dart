import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CarService extends StatelessWidget {
  const CarService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),

      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
