import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/register.dart';

abstract class DoctorRegisterController extends GetxController {
  signUp();
  goToSignIn();
  showPassWord();
}

class DoctorRegisterControllerImp extends DoctorRegisterController {
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
  update(); // لازم حتى يتحدث الواجهة
}

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;
  late TextEditingController phone;
  final PageController pageController = PageController();
  int currentPage = 0;

  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  MyServices myServices = Get.find();

  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController certificateController = TextEditingController();

  final List<String> specialties = [
    'Cardiology',
    'Dermatology',
    'Neurology',
    'Pediatrics',
    'General Medicine',
  ];
  String? selectedSpecialty;

  nextPage(int page) {
    currentPage = page;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  next() {
  

    if (currentPage ==1) {
      print("doctor register");
        signUp() ;

    } else {
        currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 700),
        curve: Curves.bounceIn,
      );
    }
    update();
  }

  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  onSpecialtyChanged(val) {
    selectedSpecialty = val;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  signUp() async {
    //   if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await signUpData.postDoctordata(
      username.text,
      password.text,
      email.text,
      phone.text,
      repassword.text,
      certificateFile!
     
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      print(
        ":2222222222222222222222222222222222222222222222222222222222222222222222",
      );
      //     if (response['status'] == 200) {
      //       myServices.box.write("account", accountType.value);
      //       // myServices.box.write("step", "2");
      Get.offNamed(
        AppRoute.verifyCodeRegister,
        arguments: {"email": email.text},
      );
      //       getSnakBar(
      //           "24".tr,
      //           "Verification Code sent to\n ${response['data']['email']}\n ${response['data']['code']} ",
      //           3);
      //     } else if (response['status'] == 422) {
      //       Get.defaultDialog(
      //           title: "203".tr, middleText: "${response["message"]}");
      //       statusRequest = StatusRequest.failure;
      //     } else if (response['status'] == 400) {
      //       Get.defaultDialog(
      //           title: "203".tr, middleText: "${response["message"]}");
      //       statusRequest = StatusRequest.failure;
    }
    //   }
    update();
    // } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    repassword.dispose();
    phone.dispose();

    super.dispose();
  }
}
