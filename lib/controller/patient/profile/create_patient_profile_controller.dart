import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/choose_image.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/profile/create_doctor_profile_data.dart';

abstract class CreatePatientProfileController extends GetxController {
  createProfile();
  getImage();
}

class CreatePatientProfileControllerImp extends CreatePatientProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  CreateDoctorProfileData loginData = CreateDoctorProfileData(Get.find());
  MyServices myServices = Get.find();
  @override
  createProfile() {}

  String? gender;
  DateTime? birthdate;
  File? profilePhoto;

  late TextEditingController addressController;
  late TextEditingController phoneController;

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
    }
  }

  @override
  void onInit() async {
    addressController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    if (profilePhoto != null) {
      profilePhoto!.delete();
    }
    super.onClose();
  }
}
