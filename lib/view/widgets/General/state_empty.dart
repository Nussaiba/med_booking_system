


  import 'package:flutter/material.dart';

Widget buildEmptyState(String title , String ?subtitle,IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.blue.shade300,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 12),
        subtitle != null ? Text(
         subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ):Container(),
          SizedBox(height: 24),
         
        ],
      ),
    );
  }







