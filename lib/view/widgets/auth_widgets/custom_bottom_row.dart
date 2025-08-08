import 'package:flutter/material.dart';

Widget buildBottomRow(String text1, String text2, void Function()? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Spacer(),
      Text(
        text1,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      InkWell(
        onTap: onTap,
        child: Text(
         text2,
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Spacer(),
    ],
  );
}
