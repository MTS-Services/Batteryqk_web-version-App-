import 'package:get/get.dart';

class CustomDropdownController extends GetxController {
  var selectedItem = RxnString();

  void changeSelectedItem(String? value) {
    selectedItem.value = value;
  }
}
