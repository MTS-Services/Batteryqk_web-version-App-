import 'package:batteryqk_web_app/features/authentication/controllers/icon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../styles/styles.dart';

class CustomReviewIcons extends StatelessWidget {
  const CustomReviewIcons({super.key, this.showText = false});
  final bool showText;

  @override
  Widget build(BuildContext context) {
    final iconController = IconController();
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          Obx(
            () => InkWell(
              // onDoubleTap: () {
              //   iconController.isSelected.value = false;
              // },
              onTap: () {
                iconController.isSelected.value = true;
                iconController.selectedIndex.value = i;
              },
              child: Icon(
                Icons.star,
                color:
                    iconController.isSelected.value
                        ? iconController.selectedIndex.value >= i
                            ? Colors.amber
                            : Colors.grey
                        : Colors.grey,
                size: 25,
              ),
            ),
          ),
        SizedBox(width: 10),
        if (showText) CustomSectionSubtitleText(subtitle: '(5/5)'),
      ],
    );
  }
}
