import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const MyCustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
