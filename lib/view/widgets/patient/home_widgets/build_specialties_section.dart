
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/data/model/patient/specialty_model.dart';
import 'package:med_booking_system/data/model/s.dart';

Widget buildSpecialtiesSection(List<SpecialtyModel> specialties) {
    return SizedBox(
      height: Get.height * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          return Container(
            width: 84,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  // width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // child: Icon(
                  //   specialties[index].icon,
                  //   color: Colors.blue[600],
                  //   size: 26,
                  // ),

                  child:  Center(
                    child: Text(
                                     specialties[index].name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    
                    textAlign: TextAlign.center,
                                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Text(
                //  specialties[index].name,
                //   style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),

                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
