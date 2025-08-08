
import 'package:flutter/material.dart';

class CustomTextAndSubText extends StatelessWidget {
  const CustomTextAndSubText({
    super.key,
    required this.text,
    required this.subtext,
  });
  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8),
        Text(subtext, style: TextStyle(fontSize: 14, color: Color(0xFF7F8C8D))),
      ],
    );
  }
}
