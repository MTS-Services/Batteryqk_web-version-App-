import 'package:flutter/material.dart';

/// Custom large title text
class CustomTitleText extends StatelessWidget {
  final String text;

  const CustomTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }
}

/// Custom section header text
class CustomSectionHeaderText extends StatelessWidget {
  final String text;

  const CustomSectionHeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

/// Custom paragraph/body text
class CustomParagraphText extends StatelessWidget {
  final String text;

  const CustomParagraphText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Colors.black87,
      ),
    );
  }
}
