import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class ListingsTab extends StatelessWidget {
  const ListingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List listings = [
      {
        'id': 1,
        'name': 'Elite Swimming Academy',
        'category': 'Swimming',
        'location': 'Downtown',
        'age': 'All Ages',
        'rating': 5,
        'featured': false,
      },
      {
        'id': 2,
        'name': 'Champions Football Academy',
        'category': 'Football',
        'location': 'North Side',
        'age': 'All Ages',
        'rating': 4,
        'featured': false,
      },
      {
        'id': 3,
        'name': 'Little Stars Nursery',
        'category': 'Other',
        'location': 'East Side',
        'age': 'All Ages',
        'rating': 5,
        'featured': false,
      },
      {
        'id': 4,
        'name': 'Hoops Basketball Center',
        'category': 'Basketball',
        'location': 'West Side',
        'age': 'All Ages',
        'rating': 4,
        'featured': false,
      },
      {
        'id': 5,
        'name': 'Ace Tennis Club',
        'category': 'Tennis',
        'location': 'South Side',
        'age': 'All Ages',
        'rating': 5,
        'featured': false,
      },
      {
        'id': 6,
        'name': 'Bright Beginnings Nursery',
        'category': 'Other',
        'location': 'Central',
        'age': 'All Ages',
        'rating': 4,
        'featured': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Listings Management',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            /// Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.blueColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                  ), child: Text('Add Category'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('New Listing'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.blueColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Table
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DataTable(
                headingRowColor:
                WidgetStateProperty.all(Colors.grey.shade100),
                columnSpacing: 20,
                dataRowMaxHeight: 60,
                headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.blackColor),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('NAME')),
                  DataColumn(label: Text('CATEGORY')),
                  DataColumn(label: Text('LOCATION')),
                  DataColumn(label: Text('AGE GROUP')),
                  DataColumn(label: Text('RATING')),
                  DataColumn(label: Text('FEATURED')),
                  DataColumn(label: Text('ACTIONS')),
                ],
                rows: listings.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(Text(item['name'])),
                    DataCell(Text(item['category'])),
                    DataCell(Text(item['location'])),
                    DataCell(Text(item['age'])),
                    DataCell(Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < item['rating']
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColor.orangeColor,
                          size: 20,
                        );
                      }),
                    )),
                    DataCell(Icon(
                      item['featured']
                          ? Icons.check_circle
                          : Icons.cancel_outlined,
                      color: item['featured'] ? Colors.green : Colors.red,
                    )),
                    DataCell(Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility,
                              color: Colors.blueAccent),
                          tooltip: 'View',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                          const Icon(Icons.edit, color: Colors.orangeAccent),
                          tooltip: 'Edit',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                          const Icon(Icons.delete, color: Colors.redAccent),
                          tooltip: 'Delete',
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
