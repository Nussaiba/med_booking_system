import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/forgetpassword/resetpassword_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_bottom_row.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/custom_circle.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/custom_text_subtext.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/reset_password_widget/cusyom_back.dart';
import 'package:med_booking_system/view/widgets/General/custom_text_field.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Stack(
        children: [
          CustomTopCircle(),
          SingleChildScrollView(
            child: GetBuilder<ResetPasswordControllerImp>(
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
                            text: "Reset Your Password",
                            subtext:
                                "Enter the verification code sent to ${controller.email} and your new password.",
                          ),

                          SizedBox(height: 20),
                          // OTP Field
                          CustomTextField(
                            // suffix:
                            // _secondsRemaining > 0
                            //     ? Text(
                            //       "$_secondsRemaining s",
                            //       style: TextStyle(color: Colors.teal),
                            //     )
                            //     : TextButton(
                            //       onPressed: () {
                            //         _startCountdown();
                            //      
                            //       },
                            //       child: const Text("Resend"),
                            //     ),
                            mycontroller: controller.otpController,
                            hinttext: "Enter Verification Code",
                            labeltext: "Verification Code",
                            icon: Icons.verified_rounded,
                            valid: (value) {
                              if (value == null || value.length != 6) {
                                return 'Enter 6-digit code';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // New Password
                          CustomTextField(
                            mycontroller: controller.password,
                            hinttext: 'Enter New Password',
                            labeltext: 'New Password',
                            iconData:
                                controller.isShowPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                            icon: Icons.lock_outline,
                            obscureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassWord();
                            },

                            valid: (value) {
                              // return isPasswordCompliant(value!);
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),
                          CustomTextField(
                            mycontroller: controller.repassword,
                            hinttext: 'Enter Confirmation Password',
                            labeltext: 'Confirmation Password',
                            iconData:
                                controller.isShowRePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                            obscureText: controller.isShowRePassword,
                            onTapIcon: () {
                              controller.showRePassWord();
                            },
                            icon: Icons.lock_outline,
                            valid: (val) {
                              return null;
                              // return validInput(val!, 8, 20, "password");
                            },
                          ),
                          SizedBox(height: 25),
                          CustomBottonAuth(
                            text: "Reset Password",
                            onPressed: () {
                              controller.goToSuccessResetPassword();
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
