import 'package:batteryqk_web_app/features/authentication/views/points.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final pageList = [
    Container(),
    Scaffold(body: Container(color: Colors.red)),
    Points(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  final _title = [
    'Home',
    'Listings',
    'Loyalty',
    'Car Services',
    'FAQs',
    'Notifications',
    'Admin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: _title.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_title[index]),
              splashColor: AppColor.appLightGreenColor,
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pageList[index]),
                  );
                });
              },
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2);
        },
        ),
      ),
    );
  }
}
