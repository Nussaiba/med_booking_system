import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/crud.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/rating_data.dart';

class RatingController extends GetxController {
  late TextEditingController feedbackController;
  MyServices myServices = Get.find();

  RatingData ratingData = RatingData(Get.put(Crud()));

  StatusRequest statusRequest = StatusRequest.none;
  var rating = 0.0.obs; 

  
  bool validateRating() {
    if (rating.value == 0.0) {
      CustomSnackbar.show(
        title: "Validation",
        message: "Please select a rating before submitting.",
        isSuccess: false,
      );
      return false;
    }

    if (feedbackController.text.trim().isEmpty) {
      CustomSnackbar.show(
        title: "Validation",
        message: "Feedback cannot be empty.",
        isSuccess: false,
      );
      return false;
    }

    return true;
  }

  Future<void> sendRating(String appointmentId) async {
    if (!validateRating()) return; 
    statusRequest = StatusRequest.loading;
    update();

    var response = await ratingData.ratingCenterData(
      appointmentId,
      rating.value.toString(),
      feedbackController.text.trim(),
    );

    statusRequest = handlingData(response);
print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == 200) {
        CustomSnackbar.show(
          title: "Success",
          message: "${response['message']}",
          isSuccess: true,
        );
      } else {
        CustomSnackbar.show(
          title: "Error",
          message: "${response['message'] ?? 'Something went wrong'}",
          isSuccess: false,
        );
      }
    } else {
      CustomSnackbar.show(
        title: "Error",
        message: "Failed to send rating. Please try again.",
        isSuccess: false,
      );
    }
    update();
  }

  @override
  void onInit() {
    feedbackController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }
}
