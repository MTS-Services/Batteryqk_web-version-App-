import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'edit_dialog_box.dart';
import 'header_cell_widget.dart';

class ListingTab extends StatefulWidget {
  const ListingTab({super.key});

  @override
  State<ListingTab> createState() => _ListingTabState();
}

class _ListingTabState extends State<ListingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Listing Management",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          Card(
            elevation: 1,
            color: Colors.white,
            child: Row(
              children: [
                HeaderCell(flex: 1, label: 'ID', color: Colors.black),
                HeaderCell(flex: 2, label: 'NAME', color: Colors.black),
                HeaderCell(flex: 3, label: 'CATEGORY', color: Colors.black),
                HeaderCell(flex: 2, label: 'LOCATION', color: Colors.black),
                HeaderCell(flex: 2, label: 'AGE GROUP', color: Colors.black),
                HeaderCell(flex: 2, label: 'ACTION', color: Colors.black),
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
                        label: 'Elite Swimming Academy',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 3,
                        label: 'Swimming',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: 'Downtown',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        label: 'Age Group',
                        color: Colors.black,
                      ),
                      HeaderCell(
                        flex: 2,
                        icons: [Icons.edit, Icons.delete_rounded],
                        iconColors: [Colors.yellow.shade300, Colors.red],
                        onIconPressed: (value) {
                          if (value == Icons.edit) {
                            showConfirmDialog(
                              context: context,
                              title: 'Edit User',
                              onConfirmed: () {
                                print('User edited.');
                              },
                              confirmText: 'Save',
                              cancelText: 'Cancel',
                              isEdit: true,
                              initialValue1: 'Elite Swimming Academy',
                              initialValue2: 'Swimming',
                              initialValue3: 'Downtown',
                              initialValue4: '3-5 years, 6-12 years, adults',
                              initialValue5: 'Paid',
                              initialValue6: AppImages.academies1a,
                              initialValue7:
                                  'Elite Swimming Academy offers professional swimming lessons for children and teenagers. Our Olympic-sized pool and certified instructors ensure top-quality training.',
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
