import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_details_image_group.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';

class ListingsDetails extends StatefulWidget {
  const ListingsDetails({super.key});

  @override
  State<ListingsDetails> createState() => _ListingsDetailsState();
}

class _ListingsDetailsState extends State<ListingsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
    child: CustomAppBar(),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomDetailsImageGroup(),
          ],
        ),
      ),
    );
  }
}
