import 'package:flutter/material.dart';
import '../../../common/widgets/listings_details_custom/custom_reviews.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int starCount = 5;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'All Reviews',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return CustomReviews(
                      starCount: starCount,
                      name: 'Mark T.',
                      designation: 'Excellent facilities and coaches',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
