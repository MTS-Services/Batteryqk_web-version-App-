import 'package:batteryqk_web_app/features/admin/bookings_tab.dart';
import 'package:batteryqk_web_app/features/admin/listings_tab.dart';
import 'package:batteryqk_web_app/features/admin/reviews_tab.dart';
import 'package:batteryqk_web_app/features/admin/users_tab.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final List<Widget> tabs = [
    const UsersTab(),
    const BookingsTab(),
    const ListingsTab(),
    const ReviewsTab(),
  ];

  final List<String> labels = ['Users', 'Bookings', 'Listings', 'Reviews'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),

          /// ✅ Custom tab pill container
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: List.generate(labels.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 24),

          /// ✅ Tab content view
          Expanded(
            child: tabs[selectedIndex], // 👈 Load actual widget
          ),
        ],
      ),
    );
  }
}
