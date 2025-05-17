import 'package:batteryqk_web_app/features/admin/confirm_dialog_widget.dart';
import 'package:flutter/material.dart';

import 'header_cell_widget.dart';

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
                HeaderCell(flex: 1, label: 'ID', color: Colors.black),
                HeaderCell(flex: 2, label: 'NAME', color: Colors.black),
                HeaderCell(flex: 3, label: 'EMAIL', color: Colors.black),
                HeaderCell(flex: 2, label: 'JOIN DATE', color: Colors.black),
                HeaderCell(flex: 2, label: 'ACTIONS', color: Colors.black),
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
                        label: 'Mdtayobali@gmail.com',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: '12/03/2025',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        icons: [
                          Icons.edit_calendar,
                          Icons.delete_rounded,
                        ],
                        iconColors: [
                          Colors.yellow.shade300,
                          Colors.red,
                        ],
                        onIconPressed: (value) {
                          if (value == Icons.edit_calendar) {
                            showConfirmDialog(
                              context: context,
                              title: 'Edit User',
                              onConfirmed: () {
                                print('User edited.');
                              },
                              confirmText: 'Save',
                              cancelText: 'Cancel',
                              isEdit: true,
                              initialValue1: 'Md.Tayob ali',
                              initialValue2: 'Mdtayobali@gmail.com',
                            );
                          } else if (value == Icons.delete_rounded) {
                            showConfirmDialog(
                              context: context,
                              title: 'Delete User',
                              onConfirmed: () {
                                print('User deleted.');
                              },
                              confirmText: 'Delete',
                              cancelText: 'Cancel',
                            );
                          }
                        },
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
