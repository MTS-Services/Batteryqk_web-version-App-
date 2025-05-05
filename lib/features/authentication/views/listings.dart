import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<String> categoryItem = [
    'Swimming',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Cricket',
    'Gymnastics',
    'Other',
  ];
  final List<String> location = [
    'New York',
    'London',
    'Dubai',
    'Tokyo',
    'Berlin',
    'Toronto',
    'Paris',
    'Other',
  ];
  final List<String> ageGroup = [
    'Toddlers (0-5 years)',
    'Children (6-12 years)',
    'Teenagers (13-18 years)',
    'Adults (18+)',
  ];
  final List<String> rating = [
    '1 Star',
    '2 Stars',
    '3 Stars',
    '4 Stars',
    '5 Stars',
  ];
  final List<String> price = [
    'Free',
    'Paid',
    'Subscription'
  ];

  bool _isDropdownVisible = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _resetFilters() {
    // Reset logic can be improved depending on your use case
    setState(() {
      _isDropdownVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Toggle Dropdowns
            Center(
              child: ElevatedButton(
                onPressed: _toggleDropdown,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Filter Listings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: AppColor.appGreenColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dropdowns
            if (_isDropdownVisible)
              Column(
                children: [
                  CustomDropdownButton(
                    itemList: categoryItem,
                    listType: 'Category',
                  ),
                  CustomDropdownButton(
                    itemList: location,
                    listType: 'All Location',
                  ),
                  CustomDropdownButton(
                    itemList: ageGroup,
                    listType: 'Age Group',
                  ),
                  CustomDropdownButton(itemList: rating, listType: 'Rating'),
                  CustomDropdownButton(itemList: price, listType: 'Price'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your filter logic here
                        },
                        icon: const Icon(Icons.filter_list),
                        label: const Text(
                          'Apply Filters',
                          style: TextStyle(color: AppColor.appGreenColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _resetFilters,
                        icon: const Icon(Icons.refresh),
                        label: const Text(
                          'Reset',
                          style: TextStyle(color: AppColor.appGreenColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
