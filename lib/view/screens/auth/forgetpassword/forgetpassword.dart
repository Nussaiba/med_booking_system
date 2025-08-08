import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/forgetpassword/forgetpassword_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_bottom_row.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/custom_circle.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/custom_text_subtext.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/cusyom_back.dart';
import 'package:med_booking_system/view/widgets/General/custom_text_field.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Stack(
        children: [
          CustomTopCircle(),
          SingleChildScrollView(
            child: GetBuilder<ForgetPasswordControllerImp>(
              builder:
                  (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 120),
                          SvgPicture.asset(
                            AppImageAsset.forgotPassword,
                            height: 180,
                          ),
                          SizedBox(height: 40),
                          CustomTextAndSubText(
                            text: "Forget Password",
                            subtext:
                                "Enter your email to receive a verification code.",
                          ),
                          SizedBox(height: 40),
                          CustomTextField(
                            mycontroller: controller.email,
                            hinttext: "Enter Email Address",
                            labeltext: "Email Address",
                            icon: Icons.email_outlined,
                            valid: (value) {
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          CustomBottonAuth(
                            text: "Send Verification Code",
                            onPressed: () {
                              // Get.toNamed(AppRoute.resetPassword,
                              // arguments: {"email": controller.email.text}
                              // );
                              controller.checkemail();
                            },
                          ),
                          const SizedBox(height: 20),
                          buildBottomRow("Remember password? ", "Log In", () {
                            // controller.goToSignIn();
                          }),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
          CustomBack(),
        ],
      ),
    );
  }
}
