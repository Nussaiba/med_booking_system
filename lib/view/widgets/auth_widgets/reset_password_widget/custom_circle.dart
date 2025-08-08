
import 'package:flutter/material.dart';

class CustomTopCircle extends StatelessWidget {
  const CustomTopCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: -50,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xFFE3F2FD),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
