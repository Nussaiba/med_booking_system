import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/login_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/validinput.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_background.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_bottom_row.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_logo.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_or.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_text_field_auth.dart';

import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          CustomBackGround(),
          Center(
            child: SingleChildScrollView(
              child: GetBuilder<LoginControllerImp>(
                builder:
                    (controller) => Column(
                      children: [
                        const SizedBox(height: 40),
                        CustomLogo(),
                        const SizedBox(height: 20),
                        CustomTopText(
                          text1: "Sign in to your Account",
                          text2: "Enter your email and password to log in",
                        ),
                        const SizedBox(height: 30),
                        CustomMainContainer(
                            statusRequest: controller.statusRequest,
                            children: [
                              GoogleButton(),
                              const SizedBox(height: 15),
                              buildOrAuth(),
                              const SizedBox(height: 5),
                              buildTextFormField(
                                Icons.email,
                                "enter your email",
                                "Email",
                                null,
                                controller.email,
                                null,
                                null,
                                null,
                              ),
                              buildTextFormField(
                                Icons.lock,
                                "enter your password",
                                "password",
                                controller.isShowPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                controller.password,
                                controller.isShowPassword,
                                () {
                                  controller.showPassWord();
                                },
                                (value) {
                                  return isPasswordCompliant(value!);
                                },
                              ),
                              const SizedBox(height: 15),
                              RowRememberMeAndForgetPassword(
                                onPressed: () {
                                  controller.goToForgetPassword();
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomBottonAuth(
                                text: "LOG IN",
                                onPressed: () {
                                  controller.login();
                                  // Get.toNamed(AppRoute.mainScreen);
                                },
                              ),
                              const SizedBox(height: 20),
                              buildBottomRow(
                                "Don't have an account? ",
                                "Sign Up",
                                () {
                                  Get.toNamed(AppRoute.patientRegister);
                                },
                              ),
                            ],
                          ),
                  
                      ],
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
