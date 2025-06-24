import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {
  var selectedMainCategories = <String>[].
  obs;
  var selectedSubCategories = <String>[].obs;
  var selectedSports = <String>[].obs;

  void updateMainCategories(List<String> selected) {
    selectedMainCategories.value = selected;
    selectedSubCategories.clear();
    selectedSports.clear();
  }


  void updateSports(List<String> selected) {
    selectedSports.value = selected;
  }
}
