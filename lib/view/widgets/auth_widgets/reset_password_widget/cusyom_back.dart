
import 'package:flutter/material.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Color(0xFF2C3E50)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
