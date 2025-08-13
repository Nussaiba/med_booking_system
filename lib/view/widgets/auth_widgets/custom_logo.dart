
import 'package:flutter/material.dart';

class CustomTopText extends StatelessWidget {
  final String text1;
    final String text2;

  const CustomTopText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
         text1,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
         Text(
          textAlign: TextAlign.center,
         text2,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }
}

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Icon(Icons.account_circle, size: 50, color: Colors.blue),
    );
  }
}
