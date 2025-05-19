import 'package:batteryqk_web_app/features/admin/admin_panel.dart';
import 'package:batteryqk_web_app/features/authentication/views/account.dart';
import 'package:batteryqk_web_app/features/authentication/views/car_service.dart';
import 'package:batteryqk_web_app/features/authentication/views/faqs.dart';
import 'package:batteryqk_web_app/features/authentication/views/login_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/points.dart';
import 'package:batteryqk_web_app/features/authentication/views/notification_page.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final pageList = [
    Points(),
    CarService(),
    Faqs(),
    NotificationPage(),
    AdminPanel(),
    LogInScreen(),
  ];

  final _title = [
    'Reward',
    'Car Services',
    'FAQs',
    'Notifications',
    'Admin',
    'Logout',
  ];

  final _icons = [
    Icons.card_membership_rounded,
    Icons.build_circle_outlined,
    Icons.help_outline_rounded,
    Icons.notifications_active_outlined,
    Icons.admin_panel_settings,
    Icons.logout,
  ];

  final Color primaryColor = AppColor.blueColor;
  final TextEditingController nameController = TextEditingController(
    text: 'Emon Halder',
  );
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _locationController = TextEditingController(
    text: 'Dhaka, Bangladesh',
  );
  final FocusNode _locationFocusNode = FocusNode();

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

                // Editable name with pencil icon
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star, size: 18, color: AppColor.orangeColor),
                      SizedBox(width: 8),
                      Text(
                        'Gold Member - 1200 Points',
                        style: TextStyle(
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

          // Menu List + Location
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ...List.generate(_title.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => pageList[index]),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _icons[index],
                                  color: primaryColor,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _title[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 24),

                // Location Section
                Container(
                  padding: const EdgeInsets.all(15),
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
                      const Text(
                        "Location",
                        style: TextStyle(
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
                              decoration: const InputDecoration(
                                hintText: "Enter your location",
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
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
