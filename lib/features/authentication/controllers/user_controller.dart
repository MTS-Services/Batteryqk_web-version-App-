import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/services/user_service.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  final isLoading = false.obs;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    try {
      isLoading.value = true;

      final result = await UserService.getAllUser();
      print('result ===== $result');

      if (result.isNotEmpty) {
        userList.value = result; // ✅ এখানে পুরো লিস্ট অ্যাসাইন করো
      } else {
        print('No user found');
      }
    } catch (e) {
      print('Error loading user: $e');
      Get.snackbar('Error', e.toString().split('] ').last);
    } finally {
      isLoading.value = false;
    }
  }
}
