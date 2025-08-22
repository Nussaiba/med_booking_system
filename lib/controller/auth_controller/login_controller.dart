import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/login.dart';


abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  // String? device_token;
   String? role;
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
  

  String doctorRole = "doctor";
  String patientRole = "patient";
String currentRole = "patient" ;
 
 updateChoosenType(String role) {
    currentRole = role;
    print(
      "==============================$currentRole===============================",
    );
    update();
  }


  @override
  login() async {
    int role = 1;
    // if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      print(currentRole);
      update();
      print("11111111111111111111111111  Controller");
      var response = await loginData.postdata(email.text, password.text,currentRole);

      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 200) {
           CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
      //     // await loginData.device_token(device_token);
      //     myServices.box.write("token", "${response["data"]["token"]}");
      //     myServices.box.write("id", "${response["data"]["user"]["id"]}");
      //     myServices.box.write("email", "${response["data"]["user"]["email"]}");
      //     myServices.box
      //         .write("user_name", "${response["data"]["user"]["user_name"]}");

      //     myServices.box
      //         .write("account", "${response["data"]["user"]["type"]}");
      //     myServices.box.write(
      //         "image",
      //         "${response["data"]["user"]["type"]}" == 'company'
      //             ? response["data"]["user"]['more_info']['logo']
      //             : response["data"]["user"]['more_info']['image']);

      //     myServices.box.write("step", "4");
      //     print(response['data']['user']);
      //     print("token ${response["data"]["token"]}");
      //     print("${response["data"]["user"]["type"]}");
      //     var response333 = await loginData.device_token(device_token);
      //     print(
      //         "==========================${response333['status']}===============================================");

      //     if ("${response["data"]["user"]["type"]}" == "job_seeker") {
         currentRole == 'patient' ?   Get.offAllNamed(AppRoute.mainPatientScreen):  Get.offAllNamed(AppRoute.mainDoctorScreen);
      //     } else {
      //       if ("${response["data"]["user"]["type"]}" == "company")
      //         Get.offAllNamed(AppRoute.mainScreensCompany);
      //     }
      //     getSnakBar(
      //         "24".tr,
      //         response['message'],
      //         // "Welcolme ${response["data"]["user"]["user_name"]} \nBy : ${response['data']['user']['email']}",
      //         3);
        } else if (response['status'] == 403|| response['status'] == 401) {
           CustomSnackbar.show(
          title: "false",
          message: "${response['message']}",
          isSuccess: false,
        );
        }
        update();
      // }
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.patientRegister);
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    // await FirebaseMessaging.instance.getToken().then((value) {
    //   device_token = value;
    //   print(device_token);
    // });
    // print(device_token);
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
