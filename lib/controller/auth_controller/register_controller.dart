import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/register.dart';

abstract class SinUpController extends GetxController {
  SignUp();
  goToSignIn();
  showPassWord();
}

class SignUpControllerImp extends SinUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;
    late TextEditingController phone;

  late String role;

  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  MyServices myServices = Get.find();


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
  SignUp() async {
 //   if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");
      var response = await signUpData.postdata(
          username.text, password.text, email.text,phone.text, repassword.text,"patient");
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      print(response);
      if (StatusRequest.success == statusRequest) {
        print(":2222222222222222222222222222222222222222222222222222222222222222222222");
    //     if (response['status'] == 200) {
    //       myServices.box.write("account", accountType.value);
    //       // myServices.box.write("step", "2");
          Get.offNamed(AppRoute.verifyCodeRegister,
              arguments: {"email": email.text});
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

  var accountType = ''.obs;
  bool isActiveseeker = false;
  bool isActiveCompany = false;

  // void setAccountSeeker(String type) {
  //   isActiveseeker = true;
  //   isActiveCompany = false;
  //   accountType.value = type;
  // }

  // void setAccountCompany(String type) {
  //   isActiveseeker = false;
  //   isActiveCompany = true;
  //   accountType.value = type;
  // }


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
