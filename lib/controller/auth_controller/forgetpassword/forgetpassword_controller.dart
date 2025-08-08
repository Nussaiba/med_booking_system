import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/forgetpassword/forgotpassword.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController emailController;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkemail() async {
    // if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response = await checkEmailData.postdata(email.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);

      if (StatusRequest.success == statusRequest) {
      //   (response['status'] == 200) {
          Get.offNamed(
            AppRoute.resetPassword,
            arguments: {"email": email.text},
          );
        // } else if (response['status'] == 500) {
        //   Get.defaultDialog(
        //     title: "203".tr,
        //     middleText: "The selected email is invalid.",
        //   );
        // }
      // }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
