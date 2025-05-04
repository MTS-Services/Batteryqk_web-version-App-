
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Welcome to Home Screen!',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

