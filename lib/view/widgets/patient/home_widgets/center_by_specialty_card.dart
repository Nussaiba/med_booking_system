import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/data/model/patient/new/ss.dart';
import 'package:med_booking_system/view/screens/patient/show_center_details.dart';

class MedicalCenterBySpecialtyCard extends StatelessWidget {
 
  final CenterBySpecialtyModel center;
  const MedicalCenterBySpecialtyCard({required this.center});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CenterDetailsScreen(), arguments: {
          
         
          'center_id': center.centerId});
      },
      child: SizedBox(
        width: Get.width * .88,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.vertical(
                  //     top: Radius.circular(18),
                  //   ),
                  //   child: Image.asset(
                  //     center.imageUrl,
                  //           width: Get.width*.84,

                  //     height:  Get.height * 0.18,

                  //     fit: BoxFit.fill,
                  //   ),
                  // ),

                   ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      AppImageAsset.center4,
                      // center.imageUrl,
                            width: Get.width*.84,

                      height:  Get.height * 0.18,

                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.bookmark_border, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    center.centerName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          '4,0',
                          // center.rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    center.centerAddress,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  Wrap(
//                   spacing: 6,
//                   runSpacing: 6,
//                   children: (['specialties']
//                           as List)
//                       .map((spec) => Chip(
//                             label: Text(spec),
//                             backgroundColor: Colors.blue[50],
//                             labelStyle: const TextStyle(fontSize: 10),
//                           ))
//                       .toList(),
//                 ),