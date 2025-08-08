import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/routes.dart';

class ChooseAcoountController extends GetxController {
  String? selectedRole;
  String doctorRole = 'doctor';
  String patientRole = 'patient';

  goToRegister() {
    if (selectedRole == 'doctor') {
      Get.toNamed(AppRoute.doctorRegister);
    } else if (selectedRole == 'patient') {
      Get.toNamed(AppRoute.patientRegister);
    }
  }

  updateChoosenType(String role) {
    selectedRole = role;
    print(
      "==============================$selectedRole===============================",
    );
    update();
  }
}
