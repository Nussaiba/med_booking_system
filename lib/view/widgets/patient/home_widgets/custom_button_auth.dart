
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/routes.dart';

class CustomBottonAuth extends StatelessWidget {
  final String text;
final void Function() onPressed;
  const CustomBottonAuth({
    super.key, required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
          onPressed:onPressed ,
          child:  Text(
           text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}