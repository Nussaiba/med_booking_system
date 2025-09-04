import 'dart:convert';
import 'dart:io';
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
import 'package:http/http.dart' as http;

abstract class CreatePatientProfileController extends GetxController {
  createProfile();
  getImage();
}

class CreatePatientProfileControllerImp extends CreatePatientProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  PatientProfileData data = PatientProfileData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  // الصورة
  File? profilePhoto;
  ImageAndFileData imageData = ImageAndFileData();

  // Personal Info
  String? gender;
  DateTime? birthdate;
  final List<String> genders = ['male', 'female'];
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  // Medical Info
  String? bloodType;
  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  late TextEditingController conditionController;
  late TextEditingController medicalHistoryController;
  late TextEditingController allergiesController;
  late TextEditingController currentMedicationsController;
  late TextEditingController familyHistoryController;
  late TextEditingController heightController;
  late TextEditingController weightController;

  // Emergency Contact
  late TextEditingController emergencyNameController;
  late TextEditingController emergencyPhoneController;

  // Lifestyle
  String? smokingStatus;
  String? alcoholConsumption;
  final List<String> smokingOptions = ['Smoker', 'Non-Smoker'];
  final List<String> alcoholOptions = ['Yes', 'No'];
  late TextEditingController lifestyleNotesController;

  // Insurance
  late TextEditingController insuranceProviderController;
  late TextEditingController insuranceNumberController;
  DateTime? insuranceExpiry;

  @override
  createProfile() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await data.postPatientProfileData(
      // Personal Info
      phone: phoneController.text,
      address: addressController.text,
      gender: gender,
      birthdate: birthdate?.toIso8601String().substring(0, 10),

      // Medical Info
      condition: conditionController.text,
      medicalHistory: medicalHistoryController.text,
      allergies: allergiesController.text,
      currentMedications: currentMedicationsController.text,
      familyMedicalHistory: familyHistoryController.text,
      bloodType: bloodType,
      height: int.tryParse(heightController.text),
      weight: int.tryParse(weightController.text),

      // Emergency Contact
      emergencyContactName: emergencyNameController.text,
      emergencyContactPhone: emergencyPhoneController.text,

      // Lifestyle
      smokingStatus: smokingStatus,
      alcoholConsumption: alcoholConsumption,
      lifestyleNotes: lifestyleNotesController.text,

      // lastVisit: DateTime.now().toIso8601String().substring(0, 10),
      // nextFollowUp: DateTime.now().add(Duration(days: 14)).toIso8601String().substring(0, 10),
      // treatmentNotes: "Continue current regimen; repeat labs next visit.",

      // Language
      preferredLanguage: "en",

      // Insurance
      insuranceProvider: insuranceProviderController.text,
      insuranceNumber: insuranceNumberController.text,
      insuranceExpiry: insuranceExpiry?.toIso8601String().substring(0, 10),

      // Profile Status
      status: "active",
    );

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (response['status'] == 200) {
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

    update();
  }

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
    }
  }

  Future<void> pickInsuranceExpiry() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      insuranceExpiry = picked;
      update();
    }
  }

  @override
  void onInit() {
    // Personal Info
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    // Medical Info
    conditionController = TextEditingController();
    medicalHistoryController = TextEditingController();
    allergiesController = TextEditingController();
    currentMedicationsController = TextEditingController();
    familyHistoryController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();

    // Emergency
    emergencyNameController = TextEditingController();
    emergencyPhoneController = TextEditingController();

    // Lifestyle
    lifestyleNotesController = TextEditingController();

    // Insurance
    insuranceProviderController = TextEditingController();
    insuranceNumberController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // Personal Info
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();

    // Medical Info
    conditionController.dispose();
    medicalHistoryController.dispose();
    allergiesController.dispose();
    currentMedicationsController.dispose();
    familyHistoryController.dispose();
    heightController.dispose();
    weightController.dispose();

    // Emergency
    emergencyNameController.dispose();
    emergencyPhoneController.dispose();

    // Lifestyle
    lifestyleNotesController.dispose();

    // Insurance
    insuranceProviderController.dispose();
    insuranceNumberController.dispose();

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
