import 'package:flutter/material.dart';

Widget buildEmptyState(
  String title,
  String? subtitle,
  IconData icon, {
  String? buttonText,
  VoidCallback? onPressed,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: Colors.blue.shade300,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 12),

        // subtitle إذا موجودة
        if (subtitle != null)
          Text(
            subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),

        const SizedBox(height: 16),

        // الزر إذا onPressed موجودة
        if (onPressed != null)
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
            child: Text(
              buttonText ?? "Create Profile Now",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),

        const SizedBox(height: 20),
      ],
    ),
  );
}
