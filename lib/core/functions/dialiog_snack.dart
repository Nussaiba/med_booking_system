// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// getDialog(String title, String message) async {
//   return await Get.defaultDialog(
//     title: title,
//     middleText: message,
//     middleTextStyle: TextStyle(color: AppColor.TextColor()),
//     titleStyle: TextStyle(color: AppColor.TextColor()),
//     backgroundColor: AppColor.Backgroundcolor(),
//   );
// }

// getSnakBar(String title, String message, int seconds) async {
//   return Get.snackbar(title, message,
//       colorText: AppColor.TextColor(),
//       backgroundColor: AppColor.Backgroundcolor().withOpacity(0.7),
//       duration: Duration(seconds: seconds));
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show({
    required String title,
    required String message,
    bool isSuccess = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isSuccess
          ? const Color(0xFFE0F7F1) // أخضر ناعم
          : const Color(0xFFFFEBEE), // أحمر وردي خفيف
      colorText: Colors.black87,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: 12,
      duration: duration,
      icon: Icon(
        isSuccess ? Icons.check_circle_outline : Icons.error_outline,
        color: isSuccess ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
      ),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
      borderColor: isSuccess ? const Color(0xFFB2DFDB) : const Color(0xFFFFCDD2),
      borderWidth: 1,
    );
  }
}
