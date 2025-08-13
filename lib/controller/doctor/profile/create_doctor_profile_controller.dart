import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/main_screen_controller.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/show_doctor_profle_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/choose_image.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/profile/create_doctor_profile_data.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/profile/show_by_doctor.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/main_doctor_screens.dart';

abstract class CreateProfileController extends GetxController {
  createProfile();
  getImage();
}

class CreateProfileControllerImp extends CreateProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  DoctorProfileByDoctorData data = DoctorProfileByDoctorData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  DoctorProfileModel? doctor;

  @override
  createProfile() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.createPostdata(
      nameController.text,
      birthdate?.toString().substring(0, 10),
      gender,
      profilePhoto,
      addressController.text,
      aboutMe.text,
      '1',
      yearsExperienceController.text,
      certificateFile,
      appointmentDurationController.text,
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
       Get.find<MainDoctorScreenController>().selectedIndex.value = 0;
        Get.find<MainDoctorScreenController>().onItemClick(0);
      final controller = Get.find<ShowDoctorProfleController>();
        controller.getDoctorProfileByDoctor();
        Get.offAllNamed(AppRoute.mainDoctorScreen);
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String? gender;
  DateTime? birthdate;
  File? profilePhoto;
  String? specialty;
  final List<String> genders = ['male', 'female'];
  final List<String> specialties = [
    'Cardiology',
    'Dermatology',
    'Neurology',
    'Pediatrics',
  ];
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController aboutMeController;
  late TextEditingController yearsExperienceController;
  late TextEditingController certificateController;
  late TextEditingController appointmentDurationController;
  late TextEditingController aboutMe;
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

  File? certificateFile;
  chooseCertificateFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.single.path != null) {
      setCertificateFile(File(result.files.single.path!));
    }
  }

  void setCertificateFile(File file) {
    certificateFile = file;
    update();
  }

  @override
  void onInit() async {
    nameController = TextEditingController();
    addressController = TextEditingController();
    aboutMeController = TextEditingController();
    yearsExperienceController = TextEditingController();
    certificateController = TextEditingController();
    appointmentDurationController = TextEditingController();
    aboutMe = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    aboutMeController.dispose();
    yearsExperienceController.dispose();
    certificateController.dispose();
    appointmentDurationController.dispose();
    aboutMe.dispose();

    super.dispose();
  }

  @override
  void onClose() {
    // birthdate - null;
    if (profilePhoto != null) {
      profilePhoto!.delete();
    }
    if (certificateFile != null) {
      certificateFile!.delete();
    }
    super.onClose();
  }
}
