import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/common/widgets/custom_dropdown.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_dropdown_Listings.dart';

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
  final List<String> price = ['Free', 'Paid', 'Subscription'];

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
      islogin = false;
    });
  }
  bool islogin = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: _toggleDropdown,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.appGreenColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 4,
                ),
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Filter Listings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            if (_isDropdownVisible)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Apply Filters',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      CustomDropdownListings(
                        itemList: categoryItem,
                        listType: 'Category',
                      ),
                      CustomDropdownListings(
                        itemList: location,
                        listType: 'All Location',
                      ),
                      CustomDropdownListings(
                        itemList: ageGroup,
                        listType: 'Age Group',
                      ),
                      CustomDropdownListings(
                        itemList: rating,
                        listType: 'Rating',
                      ),
                      CustomDropdownListings(itemList: price, listType: 'Price'),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  islogin = true;
                                });
                              },
                              icon: const Icon(Icons.check_circle_outline),
                              label: const Text('Apply Filters'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: islogin ? AppColor.appGreenColor : Colors.grey.shade200,
                                foregroundColor: islogin ? Colors.white : Colors.black87,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _resetFilters,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Reset'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: islogin ? Colors.grey.shade200 : AppColor.appGreenColor,
                                foregroundColor: islogin ? Colors.black87 : Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
