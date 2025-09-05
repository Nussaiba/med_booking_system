import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/doctor_details_data.dart';
import 'package:med_booking_system/data/model/patient/new/doctor_profile.dart';

class DoctorDetailsController extends GetxController {
  DoctorDetailsData data = DoctorDetailsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DoctorProfile? doctor;
  late String doctorId;

  getDoctorDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await data.getDoctorDetailsData(doctorId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    update();
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        doctor = DoctorProfile.fromJson(response['data']);
        print(" DoctorDetailsModel  $doctor");
        statusRequest = StatusRequest.success;
        return doctor;
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    doctorId = Get.arguments['doctor_id'].toString();
    getDoctorDetails();
    update();
    super.onInit();
  }
}
