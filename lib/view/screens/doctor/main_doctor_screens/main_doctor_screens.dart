import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/main_screen_controller.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/doctor_home_screen.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/doctor_profile.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/appointment_screen.dart';

import 'package:med_booking_system/view/widgets/doctor/main_screens/main_screen_widgets/bottom_Bar.dart';

class MainDoctorScreens extends GetView<MainDoctorScreenController> {
  const MainDoctorScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainDoctorScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(() => buildDoctorBottomBar(controller)),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          DoctorHomeScreen(),
          AppointmentCardDemo(),
          DoctorProfileScreen(),
        ],
      ),
    );
  }
}















