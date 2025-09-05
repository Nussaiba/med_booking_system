
  import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';

Widget buildPatientProfileHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18),

      child: Row(
     
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                image: AssetImage(AppImageAsset.doctor4),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, welcome back',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 2),
                Text(
                  'Sledge Hammer',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Icon(FontAwesomeIcons.bell, color: Colors.blue, size: 22),
            ),
          ), // onPressed: _editProfile,
        ],
      ),
    );
  }
