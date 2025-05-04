import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<String> categoryList =[
    'Swimming',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Cricket',
    'Gymnastics',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
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
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.content_paste_search_outlined, color: AppColor.appGreenColor),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  isScrollControlled: true,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 4, width: 40, color: Colors.grey[300]),
                          const SizedBox(height: 16),
                          const Text('Paste Search', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter text',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Do something with the input
                              Navigator.pop(context);
                            },
                            child: const Text('Search'),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CustomDropdownButton(countyList: categoryList,listType: 'Category',),
        ],
      ),
    );
  }
}
