import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0),
      height: 42,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: TextFormField(
          //style: TextStyle(height: 1),
          decoration: InputDecoration(),
        ),
      ),
    );
  }
}
