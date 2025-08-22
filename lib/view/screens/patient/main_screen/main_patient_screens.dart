import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:med_booking_system/view/screens/auth/login_screen.dart';
import 'package:med_booking_system/view/screens/auth/success_signup.dart';
import 'package:med_booking_system/view/screens/auth/verifycode_register.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/search_screen.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_doctor_details_by_other.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/appointment_screen.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/appointments_screen.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/home_screen.dart';
import 'package:med_booking_system/view/screens/patient/profile/my_profile_patient.dart';
import 'package:med_booking_system/view/widgets/patient/main_screen_widget/custom_bottom_navigation_bar.dart';

class MainPatientScreens extends GetView<MainScreenController> {
  const MainPatientScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(() => buildBottomBar(controller)),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          HomeScreen(),
          SearchPage(),
              //  HomeScreen(),
          // ResetPasswordScreen(),
          // AppointmentCardDemo(),
          PatientAppointmentsScreen(),
          PatientProfileScreen(),
        ],
      ),
    );
  }
}
