import 'package:flutter/material.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User Management",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Card(
            elevation: 1,
            color: Colors.white,
            child: Row(
              children: [
                headerCell(flex: 1, label: 'ID'),
                headerCell(flex: 2, label: 'NAME'),
                headerCell(flex: 3, label: 'EMAIL'),
                headerCell(flex: 2, label: 'JOIN DATE'),
                headerCell(flex: 2, label: 'ACTIONS'),
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
                    headerCell(flex: 1, label: index.toString()),
                    headerCell(flex: 2, label: 'Md.Tayob ali'),
                    headerCell(flex: 3, label: 'Mdtayobali@gmail.com'),
                    headerCell(flex: 2, label: '12/03/2025'),
                    headerCell(flex: 2, label: 'ACTIONS'),
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );
  }
  Widget headerCell({required int flex, required String label}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
