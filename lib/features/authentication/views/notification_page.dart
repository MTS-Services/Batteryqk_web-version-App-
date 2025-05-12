import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Tab> tabs = const [
    Tab(text: "ALL"),
    Tab(text: "UNREAD"),
    Tab(text: "BOOKING"),
    Tab(text: "SYSTEM"),
  ];

  // Read status list
  List<bool> isRead = List.generate(10, (index) => false);

  void markAllAsRead() {
    setState(() {
      isRead = List.filled(isRead.length, true);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications marked as read"),
        backgroundColor: AppColor.blueColor,
      ),
    );
  }

  void markAsRead(int index) {
    if (!isRead[index]) {
      setState(() {
        isRead[index] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor:
            AppColor.whiteColor, // Set whole page background to white
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(isBack: true),
        ),
        body: TabBarView(
          children: [
            _buildNotificationList("All Notifications"),
            _buildNotificationList("Unread Notifications"),
            _buildNotificationList("Booking Updates"),
            _buildNotificationList("System Alerts"),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(String type) {
    return Container(
      color: AppColor.whiteColor, // Ensure list background is white too
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: isRead.length,
        itemBuilder: (context, index) {
          return Card(
            color:
                isRead[index]
                    ? const Color.fromARGB(255, 252, 252, 252)
                    : const Color.fromARGB(255, 240, 240, 240),
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.notifications, color: AppColor.blueColor),
              title: Text("$type #${index + 1}"),
              subtitle: const Text("This is a sample notification message."),
              trailing:
                  isRead[index]
                      ? null
                      : const Icon(Icons.circle, size: 8, color: Colors.red),
              onTap: () => markAsRead(index),
            ),
          );
        },
      ),
    );
  }
}
