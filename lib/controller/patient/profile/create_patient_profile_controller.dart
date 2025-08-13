import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/show_patient_profle_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/choose_image.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/profile/profile_data.dart';
import 'package:med_booking_system/data/model/patient/paient_model.dart';

abstract class CreateProfileController extends GetxController {
  createProfile();
  getImage();
}

class CreatePatientProfileControllerImp extends CreateProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  PatientProfileData data = PatientProfileData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  PatientProfileModel? patientProfileModel;

  @override
  createProfile() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.postprofiledata(
      phoneController.text,
      addressController.text,
      gender,
      birthdate?.toString().substring(0, 10),
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        // statusRequest = StatusRequest.loading;
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );

        CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
        Get.find<MainScreenController>().selectedIndex.value = 0;
        Get.find<MainScreenController>().onItemClick(0);
        final controller = Get.find<ShowPatientProfleController>();
        controller.getPatientProfile();
        Get.offAllNamed(AppRoute.mainPatientScreen);
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String? gender;
  DateTime? birthdate;
  File? profilePhoto;

  final List<String> genders = ['male', 'female'];

  late TextEditingController phoneController;
  late TextEditingController addressController;

  ImageAndFileData imageData = ImageAndFileData();

  @override
  getImage() async {
    profilePhoto = await imageData.getImageData();
    update();
  }

  Future<void> pickBirthdate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthdate = picked;
      update();
    } else {
      birthdate = null;
    }
  }

  @override
  void onInit() async {
    phoneController = TextEditingController();
    addressController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  void onClose() {
    // birthdate - null;
    if (profilePhoto != null) {
      profilePhoto!.delete();
    }
    super.onClose();
  }
}
