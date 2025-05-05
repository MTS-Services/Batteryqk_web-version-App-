import 'package:batteryqk_web_app/util/images_path.dart';
import 'package:flutter/material.dart';

class CustomDetailsImageGroup extends StatelessWidget {
  const CustomDetailsImageGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top large image
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // More reduced roundness
          child: Container(
            height: size.height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  AppImages.academies1a,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Academy Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // First row of two smaller images
        Row(
          children: [
            _buildSmallImage(AppImages.academies1b, size),
            const SizedBox(width: 16),
            _buildSmallImage(AppImages.academies1c, size),
          ],
        ),
        const SizedBox(height: 16),

        // Second row of two smaller images
        Row(
          children: [
            _buildSmallImage(AppImages.academies1d, size),
            const SizedBox(width: 16),
            _buildSmallImage(AppImages.academies1e, size),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallImage(String imagePath, Size size) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6), // More reduced roundness
        child: Container(
          height: size.height * 0.18,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset( 
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
