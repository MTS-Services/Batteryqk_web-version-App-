import 'package:batteryqk_web_app/features/authentication/views/listings_details.dart';
import 'package:flutter/material.dart';

class Batteryqk extends StatelessWidget {
  const Batteryqk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListingsDetails(),
      debugShowCheckedModeBanner: false,
    );
  }
}