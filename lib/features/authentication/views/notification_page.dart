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

  // Simulated notifications
  final List<Map<String, dynamic>> notifications = List.generate(10, (index) {
    return {
      "title": "Notification #${index + 1}",
      "message": "This is a sample notification message.",
      "category":
          index % 4 == 0
              ? "SYSTEM"
              : index % 3 == 0
              ? "BOOKING"
              : "GENERAL",
      "isRead": false,
    };
  });

  void markAllAsRead() {
    setState(() {
      for (var notif in notifications) {
        notif["isRead"] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications marked as read"),
        backgroundColor: AppColor.blueColor,
      ),
    );
  }

  void markAsRead(int index) {
    setState(() {
      notifications[index]["isRead"] = true;
    });
  }

  List<Map<String, dynamic>> getFilteredNotifications(String type) {
    switch (type) {
      case "UNREAD":
        return notifications.where((n) => !n["isRead"]).toList();
      case "BOOKING":
        return notifications.where((n) => n["category"] == "BOOKING").toList();
      case "SYSTEM":
        return notifications.where((n) => n["category"] == "SYSTEM").toList();
      default:
        return notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(isBack: true),
        ),
        body: Column(
          children: [
            // ✅ Mark All as Read button ABOVE TabBar
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton(
                onPressed: markAllAsRead,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                ),
                child: const Text(
                  "Mark All as Read",
                  style: TextStyle(color: AppColor.whiteColor),
                ),
              ),
            ),

            // ✅ TabBar just below the button
            Container(
              color: AppColor.whiteColor,
              child: TabBar(
                tabs: tabs,
                labelColor: AppColor.blueColor,
                unselectedLabelColor: Colors.black54,
                indicatorColor: AppColor.blueColor,
              ),
            ),

            // ✅ TabBarView displays the notification lists
            Expanded(
              child: TabBarView(
                children:
                    tabs.map((tab) {
                      return _buildNotificationList(tab.text!);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(String type) {
    final filteredList = getFilteredNotifications(type);

    return Container(
      color: AppColor.whiteColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final notif = filteredList[index];
          final globalIndex = notifications.indexOf(notif);

          return Card(
            color:
                notif["isRead"]
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 253, 245),
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.notifications, color: AppColor.blueColor),
              title: Text(notif["title"]),
              subtitle: Text(notif["message"]),
              trailing:
                  notif["isRead"]
                      ? null
                      : const Icon(Icons.circle, size: 8, color: Colors.red),
              onTap: () => markAsRead(globalIndex),
            ),
          );
        },
      ),
    );
  }
}
