import 'package:batteryqk_web_app/features/authentication/views/points.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batteryqk',
      home: Points(),
      debugShowCheckedModeBanner: false,
    );
  }
}
