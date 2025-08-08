import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? email;

  late TextEditingController otpController;

  late TextEditingController password;
  late TextEditingController repassword;
  bool isShowPassword = true;
  bool isShowRePassword = true;

  //   // String? verfiyCodePassWordreset;
  // int _secondsRemaining = 60;
  // late Timer _timer;
  StatusRequest statusRequest = StatusRequest.none;

  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  showRePassWord() {
    isShowRePassword = isShowRePassword == true ? false : true;
    update();
  }

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      // getDialog("203".tr, "213".tr);
    } else {
      // if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response = await resetPasswordData.postdata(
        otpController.text,
        password.text,
        repassword.text,
        email!,
      );
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);

      if (StatusRequest.success == statusRequest) {
        print("yessssssssssssssssssssssssssssss");
        // if (response['status'] == 200) {
        // print("successs $verfiyCodePassWordreset");
        Get.offNamed(AppRoute.successResetpassword);
        // } else if (response['status'] == 400) {
        //   // getDialog("203".tr, "${response["message"]}");
        // } else if (response['status'] == 422) {
        //   // getDialog("203".tr, "${response["message"]}");
      }
      update();
      // } else {}
      // }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    otpController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    //  _timer.cancel();
    otpController.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  // void _startCountdown() {
  //   _secondsRemaining = 60;
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (_secondsRemaining == 0) {
  //       timer.cancel();
  //     } else {

  //         _secondsRemaining--;
  //     }
  //   });
  // }
}
