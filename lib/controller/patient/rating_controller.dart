
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs;
  var selectedTags = <String>[].obs;
  var feedbackText = ''.obs;
  var isFormValid = false.obs;

  TextEditingController feedbackController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ever(rating, (_) => validateForm());
    ever(selectedTags, (_) => validateForm());
    ever(feedbackText, (_) => validateForm());
  }

  void validateForm() {
    isFormValid.value = rating.value > 0 && feedbackText.value.isNotEmpty;
  }

  void submitFeedback() {
    // Here you would typically send the data to your backend
    print({
      'rating': rating.value,
      'tags': selectedTags,
      'feedback': feedbackText.value
    });
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}