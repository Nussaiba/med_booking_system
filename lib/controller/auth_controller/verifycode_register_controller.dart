import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeRegisterController extends GetxController {
  goToSuccessSignUp( );
}

VerifyCodeRegisterData verifyCodeRegisterData = VerifyCodeRegisterData(
  Get.find(),
);

class VerifyCodeRegisterControllerImp extends VerifyCodeRegisterController {
  String? email;
  MyServices myServices = Get.find();
 late TextEditingController otpController;

  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");

    var response = await verifyCodeRegisterData.postdata(email!,  otpController.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      print("yessssssssssssssssssssssssss");
      print("${response["message"]}");
      Get.offNamed(AppRoute.successSignUp);
      // if (response['status'] == 200) {
      // myServices.box.write("token", "${response["data"]["token"]}");
      // getSnakBar("24".tr, "${response["message"]}", 3);
      // myServices.box.write("step", "2");

      // Get.offNamed(AppRoute.successSignUp);
      // } else if (response['status'] == 422) {
      //   print("244");
      //   // getDialog("203".tr, "${response["message"]}");
      // }
    }
    update();
  }

  Timer? timer;
  int remainingTime = 4;
  String get timerText =>
      '${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}';

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    if (remainingTime == 0) {
      remainingTime = 4;
      startTimer();
      verifyCodeRegisterData.reSendCodeData(email!);
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
     otpController = TextEditingController();
    email = Get.arguments['email'];

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
