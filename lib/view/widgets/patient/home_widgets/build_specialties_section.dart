import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/home_controller.dart';
import 'package:med_booking_system/data/model/patient/specialty_model.dart';

Widget buildSpecialtiesSection(List<SpecialtyModel> specialties) {
  return GetBuilder<PatientHomeControllerImp>(
    builder:
        (controller) => SizedBox(
          height: Get.height * 0.066,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 4),
            scrollDirection: Axis.horizontal,
            itemCount: specialties.length,
            itemBuilder: (context, index) {
               final isSelected =
                controller.selectedSpecialtyId == specialties[index].id;
              return InkWell(
                onTap: () {
                  controller.changeSpecialtyId(specialties[index].id);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // child: Icon(
                  //   specialties[index].icon,
                  //   color: Colors.blue[600],
                  //   size: 26,
                  // ),
                  child: Center(
                    child: Text(
                      specialties[index].name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
              // Text(
              //  specialties[index].name,
              //   style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),

              //   textAlign: TextAlign.center,
              // ),;
            },
          ),
        ),
  );
}
