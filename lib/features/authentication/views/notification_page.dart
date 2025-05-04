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
        backgroundColor: AppColor.appGreenColor,
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: markAllAsRead,
              child: const Text(
                "ALL READ",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            dividerColor: const Color.fromARGB(255, 226, 226, 226),
            tabs: tabs,
            isScrollable: false,
            labelColor: AppColor.appGreenColor,
            indicatorColor: AppColor.appGreenColor,
            indicatorWeight: 0.5,
            unselectedLabelColor: Colors.black,
          ),
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
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: isRead.length,
      itemBuilder: (context, index) {
        return Card(
          color:
              isRead[index]
                  ? Color.fromARGB(255, 252, 252, 252)
                  : const Color.fromARGB(255, 240, 240, 240),

          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.notifications, color: AppColor.appGreenColor),
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
    );
  }
}
