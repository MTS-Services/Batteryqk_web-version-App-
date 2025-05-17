import 'package:flutter/material.dart';

import 'header_cell_widget.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({super.key});

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Review Management",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Card(
            elevation: 1,
            color: Colors.white,
            child: Row(
              children: [
                HeaderCell(flex: 1, label: 'ID', color: Colors.black),
                HeaderCell(flex: 2, label: 'User', color: Colors.black),
                HeaderCell(flex: 3, label: 'Listing', color: Colors.black),
                HeaderCell(flex: 2, label: 'Rating', color: Colors.black),
                HeaderCell(flex: 2, label: 'Comment', color: Colors.black),
                HeaderCell(flex: 2, label: 'Date', color: Colors.black),
                HeaderCell(flex: 2, label: 'Status', color: Colors.black),
                HeaderCell(flex: 2, label: 'Actions', color: Colors.black),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Row(
                    children: [
                      HeaderCell(
                        flex: 1,
                        label: index.toString(),
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: 'Md.Tayob ali',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 3,
                        label: 'Elite Swimming Academy',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: 'Excellent facilities and coaches!',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: '5/13/2025',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: 'Pending',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        icons: [Icons.add_task, Icons.cancel_outlined],
                        iconColors: [Colors.green, Colors.red],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
