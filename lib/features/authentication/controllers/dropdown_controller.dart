import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedMainCategories = <String>[].obs;
  var selectedSubCategories = <String>[].obs;
  var selectedSports = <String>[].obs;

  // Add for other dropdowns
  var selectedLocation = RxnString();
  var selectedAgeGroup = RxnString();
  var selectedRating = RxnString();
  var selectedGender = RxnString();
  var selectedPrice = RxnString();
}
