import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/profile/profile_data.dart';
import 'package:med_booking_system/data/model/patient/paient_model.dart';
import 'package:med_booking_system/view/widgets/patient/main_screen_widget/patient_profile_widget.dart';

class ShowPatientProfleController extends GetxController {





  var selectedTab = 0.obs;
  final pageController = PageController();

  void changeTab(int index) {
    selectedTab.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  PatientProfileData data = PatientProfileData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  PatientProfileModel? patientProfileModel;

  getPatientProfile() async {
    statusRequest = StatusRequest.loading;
    var response = await data.getPatientProfilerData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      // if (response['status'] == 200) {
      // statusRequest = StatusRequest.loading;
      print(
        "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
      );
      patientProfileModel = PatientProfileModel.fromJson(response['data']);

      print(" Paitent  ${patientProfileModel}");

    
      update();

      statusRequest = StatusRequest.success;
      
      print(patientProfileModel);
      // update();
      return patientProfileModel;
    } else {
      // statusRequest = StatusRequest.failure;
    }
    // }
    update();
  }

  @override
  void onInit() {
    getPatientProfile();
    super.onInit();
  }
}


