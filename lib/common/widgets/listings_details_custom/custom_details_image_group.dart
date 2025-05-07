import 'package:flutter/material.dart';

class CustomDetailsImageGroup extends StatelessWidget {
  final String image1a;
  final String image1b;
  final String image1c;
  final String image1d;
  final String image1e;

  const CustomDetailsImageGroup({super.key, required this.image1a, required this.image1b, required this.image1c, required this.image1d, required this.image1e, });

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
                  color: Colors.black.withAlpha((0.1 * 255).toInt()),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(image1a, fit: BoxFit.cover),
                Positioned(
                  bottom: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((0.5 * 255).toInt()), // 127
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
            _buildSmallImage(image1b, size),
            const SizedBox(width: 16),
            _buildSmallImage(image1c, size),
          ],
        ),
        const SizedBox(height: 16),

        // Second row of two smaller images
        Row(
          children: [
            _buildSmallImage(image1d, size),
            const SizedBox(width: 16),
            _buildSmallImage(image1e, size),
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
                color: Colors.black.withAlpha((0.08 * 255).toInt()),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
