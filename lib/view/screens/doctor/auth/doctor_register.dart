import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/auth/doctor_register_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_background.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_bottom_row.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_logo.dart';
import 'package:med_booking_system/view/widgets/doctor/doctor_auth/page_progress_indicator.dart';
import 'package:med_booking_system/view/widgets/doctor/doctor_auth/register_page.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_container.dart';

class DoctorRegisterScreen extends StatelessWidget {
  const DoctorRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorRegisterControllerImp());
    return Scaffold(
      body: GetBuilder<DoctorRegisterControllerImp>(
        builder:
            (controller) => Stack(
              children: [
                const CustomBackGround(),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const CustomLogo(),
                        const SizedBox(height: 20),
                        CustomTopText(
                          text1: "Doctor Registration",
                          text2: "Fill your details to continue",
                        ),
                        const SizedBox(height: 30),
                        CustomMainContainer(
                          statusRequest: controller.statusRequest,
                          children: [
                            PageProgressIndicator(totalPages: 2),
                            SizedBox(
                              height: 380,
                              child: DoctorRegisterPageView(),
                            ),
                            const SizedBox(height: 20),
                            CustomBottonAuth(
                              text:
                                  controller.currentPage == 1
                                      ? "Complete Registration"
                                      : "Next",
                              onPressed: () {
                                controller.next();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        buildBottomRow(
                          "Already have an account? ",
                          "Log in",
                          () {
                            controller.goToSignIn();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
