import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/register_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/functions/validinput.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_background.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_bottom_row.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_logo.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_text_field_auth.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          CustomBackGround(),
          Center(
            child: SingleChildScrollView(
              child: GetBuilder<SignUpControllerImp>(
                builder:
                    (controller) => 
                     Column(
                        children: [
                          const SizedBox(height: 40),
                          CustomLogo(),
                          const SizedBox(height: 20),
                          CustomTopText(
                            text1: "Create New Account",
                            text2: "Fill your details to continue",
                          ),
                          const SizedBox(height: 30),
                          CustomMainContainer(
                            statusRequest: controller.statusRequest,
                            children: [
                              buildTextFormField(
                                Icons.person,
                                "enter your full name",
                                "Full Name",
                                null,
                                controller.username,
                                null,
                                null,
                                null,
                              ),
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
                                Icons.phone,
                                "enter your phone",
                                "Phone",
                                null,
                                controller.phone,
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
                                  // return isPasswordCompliant(value!);
                                  return null;
                                },
                              ),
                              buildTextFormField(
                                Icons.lock,
                                "enter your password",
                                "password",
                                controller.isShowPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                controller.repassword,
                                controller.isShowPassword,
                                () {
                                  controller.showPassWord();
                                },
                                (value) {
                                  // return isPasswordCompliant(value!);
                                  return null;
                                },
                              ),

                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (val) {},
                                    ),
                                  ),
                                  Flexible(
                                    child: RichText(
                                      text: const TextSpan(
                                        text: "I agree to the ",
                                        style: TextStyle(color: Colors.grey),
                                        children: [
                                          TextSpan(
                                            text: "Terms & Conditions",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              CustomBottonAuth(
                                text: "SIGN UP",
                                onPressed: () {
                                  print("SSSSSSSssssssssss");
                                  controller.SignUp();
                                },
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
