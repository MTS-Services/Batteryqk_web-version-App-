import 'package:batteryqk_web_app/features/authentication/views/language_page.dart';
import 'package:get/get.dart'; // add this import
import 'package:batteryqk_web_app/features/admin/admin_panel.dart';
import 'package:batteryqk_web_app/features/authentication/views/car_service.dart';
import 'package:batteryqk_web_app/features/authentication/views/faqs.dart';
import 'package:batteryqk_web_app/features/authentication/views/login_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/points.dart';
import 'package:batteryqk_web_app/features/authentication/views/notification_page.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/show_snack_bar.dart';
import '../../../data/services/firebase_service.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Color primaryColor = AppColor.blueColor;

  final TextEditingController nameController = TextEditingController(
    text: 'Emon Halder',
  );
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _locationController = TextEditingController(
    text: 'Dhaka, Bangladesh',
  );
  final FocusNode _locationFocusNode = FocusNode();

  final AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    nameController.dispose();
    _locationController.dispose();
    _focusNode.dispose();
    _locationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 40),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [primaryColor, primaryColor.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://itsmesagar.wordpress.com/wp-content/uploads/2016/07/man-13.png?w=300',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: nameController,
                        focusNode: _focusNode,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(_focusNode);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                      tooltip: 'Edit Name',
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Icon(Icons.star, size: 18, color: AppColor.orangeColor),
                      SizedBox(width: 8),
                      Text(
                        'gold_member_points'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Menu Buttons + Location Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildMenuButton(
                    icon: Icons.card_membership_rounded,
                    title: 'Reward',
                    onTap: () => Get.to(() => Points()),
                  ),
                  _buildMenuButton(
                    icon: Icons.build_circle_outlined,
                    title: 'Car Services',
                    onTap: () => Get.to(() => CarService()),
                  ),
                  _buildMenuButton(
                    icon: Icons.help_outline_rounded,
                    title: 'FAQs',
                    onTap: () => Get.to(() => Faqs()),
                  ),
                  _buildMenuButton(
                    icon: Icons.notifications_active_outlined,
                    title: 'Notifications',
                    onTap: () => Get.to(() => NotificationPage()),
                  ),
                  _buildMenuButton(
                    icon: Icons.notifications_active_outlined,
                    title: 'language'.tr,
                    onTap: () => Get.to(() => LanguagePage()),
                  ),
                  _buildMenuButton(
                    icon: Icons.admin_panel_settings,
                    title: 'Admin',
                    onTap: () => Get.to(() => AdminPanel()),
                  ),
                  _buildMenuButton(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: (){
                      signOut(context);
                    },
                  ),

                  const SizedBox(height: 24),

                // Location Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'location'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _locationController,
                              focusNode: _locationFocusNode,
                              decoration: InputDecoration(
                                hintText: 'enter_your_location'.tr,
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_location_alt),
                            onPressed: () {
                              FocusScope.of(
                                context,
                              ).requestFocus(_locationFocusNode);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: Icon(icon, color: AppColor.blueColor),
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            alignment: Alignment.centerLeft,
            foregroundColor: AppColor.blueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            shadowColor: Colors.black12,
          ),
        ),
      ),
    );
  }
  Future<void> signOut(BuildContext context) async {
    try {
      await authController.logOut(context);
      showSnackbar(context, 'Success', 'Logged out successfully');
      Get.offAll(() => LogInScreen());
    } catch (e) {
      showSnackbar(context, 'Logout Error', e.toString().split('] ').last);
    }
  }
}
