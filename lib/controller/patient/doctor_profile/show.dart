import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/all_model.dart';

class DoctorDetailsController extends GetxController {
  late DoctorModel doctor;

  @override
  void onInit() {
    
    doctor = Get.arguments['doctor'];
    super.onInit();
  }
}
