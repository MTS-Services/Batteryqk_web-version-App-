import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/features/authentication/views/listings_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Banner with image and gradient overlay
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  'https://www.self.inc/info/img/post/cost-analysis-online-travel-agencies-vs-direct/cost-analysis-online-travel-agencies-vs-direct-header.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder:
                      (context, error, stackTrace) => const SizedBox(
                        height: 200,
                        child: Center(child: Icon(Icons.error)),
                      ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black26, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildSectionTitle("Featured Activities"),
          const SizedBox(height: 12),
          _buildGridListings(),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionTitle("Top Listings"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Listings()),
                  );
                },
                child: const Text("View All"),
              ),
            ],
          ),
          const SizedBox(height: 12),

          _buildListingCard(
            context: context,
            title: "Elite Swimming Academy",
            location: "Swimming | Downtown",
            tag: "Paid",
            rating: 4.5,
            description:
                "Elite Swimming Academy offers professional swimming lessons for children and teenagers.",
            imageUrl:
                "https://d2h8hramu3xqoh.cloudfront.net/blog/wp-content/uploads/2018/07/Swimming-Benefits-Children-MentallyEmotionallyand-Physically.webp",
          ),
          _buildListingCard(
            context: context,
            title: "Power Gym Center",
            location: "Gym | Uptown",
            tag: "Free",
            rating: 4.0,
            description:
                "Power Gym Center is equipped with modern machines and certified personal trainers.",
            imageUrl:
                "https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png",
          ),
          _buildListingCard(
            context: context,
            title: "Ace Tennis Club",
            location: "Tennis | West Side",
            tag: "Paid",
            rating: 5.0,
            description:
                "Join Ace Tennis Club to enjoy premium coaching and facilities for all skill levels.",
            imageUrl:
                "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2204664465.jpg?c=16x9&q=h_833,w_1480,c_fill",
          ),
        ],
      ),
    );
  }

  static Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
      ),
    );
  }

  Widget _buildGridListings() {
    final items = [
      {
        "title": "Football",
        "img":
            "https://assets.publishing.service.gov.uk/media/63f62823d3bf7f62e4409e3a/s960_Football_gov.uk.jpg",
      },
      {
        "title": "Gym",
        "img":
            "https://i.shgcdn.com/62f0a505-76f9-4160-847f-f3dbe2ed71d0/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
      },
      {
        "title": "Swimming",
        "img":
            "https://i0.wp.com/blog.myswimpro.com/wp-content/uploads/2023/10/freestyle-stroke-breathing-technique-myswimpro.jpeg?resize=1024%2C683&ssl=1",
      },
      {
        "title": "Tennis",
        "img":
            "https://www.tennisireland.ie/wp-content/uploads/2024/11/2724520-1024x625.jpg",
      },
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    item["img"]!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Text(
                  item["title"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListingCard({
    required BuildContext context,
    required String title,
    required String location,
    required String tag,
    required double rating,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder:
                  (context, error, stackTrace) => const SizedBox(
                    height: 180,
                    child: Center(child: Icon(Icons.error)),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color:
                            tag == "Paid"
                                ? Colors.blue.shade100
                                : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color:
                          index < rating.round()
                              ? Colors.amber
                              : Colors.grey.shade300,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListingsDetails(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("View Details"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Book Now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
