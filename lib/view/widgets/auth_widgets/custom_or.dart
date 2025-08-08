

  import 'package:flutter/material.dart';

Widget buildOrAuth() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
