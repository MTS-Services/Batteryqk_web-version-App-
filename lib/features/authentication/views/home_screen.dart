import 'package:batteryqk_web_app/features/authentication/views/listings.dart';
import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _onViewAllPressed() {
    // TODO: Implement what happens when "View All" is pressed
    print('View All pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: false),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Hi, Ahmed",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Quick Access Grid with images
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildQuickAccessCardWithImage(
                "Sports Academies",
                AppImages.penguinHead,
              ),
              _buildQuickAccessCardWithImage("Nurseries", AppImages.houseShape),
              _buildQuickAccessCardWithImage("Loyality Points", AppImages.car2),
              _buildQuickAccessCardWithImage("Coming Soon", AppImages.car1),
            ],
          ),

          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(12, 255, 168, 38),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(104, 255, 168, 38),
              ),
            ),
            child: Column(
              children: [
                // Header Row with title and View All button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "POPULAR SERVICES",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Listings()),
                        );
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Card(
                  // shadowColor: const Color.fromARGB(0, 255, 255, 255),
                  child: _buildPopularServiceItem(
                    iconPath:
                        'https://models-online-persist.shakker.cloud/img/d23aaa828448417abbfbb8e2345e4dff/78ea614f0438afd7b6c2b90d90e1c429e08c973d80d1edd26aeb1a56d8d4c50d.png?x-oss-process=image/resize,w_764,m_lfit/format,webp',
                    title: "AFC Sports Academy",
                    subtitle: "Ages 3+",
                    showNotification: true,
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  // shadowColor: const Color.fromARGB(0, 255, 255, 255),
                  child: _buildPopularServiceItem(
                    iconPath:
                        'https://huggingface.co/maywell/Synatra-10.7B-v0.4/resolve/main/Synatra.png',
                    title: "Blue Skies Nursery",
                    subtitle: "Ages 5-6",
                    showNotification: true,
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  // shadowColor: const Color.fromARGB(0, 255, 255, 255),
                  child: _buildPopularServiceItem(
                    iconPath:
                        'https://img.freepik.com/premium-vector/penguin-with-white-face-blue-background_1187092-70841.jpg',
                    title: "Happy Feet",
                    subtitle: "Ages 3-5",
                    showNotification: true,
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  // shadowColor: const Color.fromARGB(0, 255, 255, 255),
                  child: _buildPopularServiceItem(
                    iconPath:
                        'https://img.freepik.com/premium-photo/cute-cartoon-penguin-illustration_1132516-706.jpg',
                    title: "Little Explorers",
                    subtitle: "Ages 4-6",
                    showNotification: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCardWithImage(String label, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(76, 0, 187, 212),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(31, 0, 187, 212),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 40, color: Colors.red),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServiceItem({
    required String iconPath,
    required String title,
    required String subtitle,
    bool showNotification = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5000),
          child: Image.network(
            iconPath,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 48,
                ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(subtitle),
        trailing:
            showNotification
                ? Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                )
                : null,
        onTap: () {},
      ),
    );
  }
}
