// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/controller/auth_controller/verifycode_register_controller.dart';
// import 'package:med_booking_system/core/class/handling_view.dart';


// class VerifyRegisterScreen extends StatelessWidget {
//   const VerifyRegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//         Get.put(VerifyCodeRegisterControllerImp());

//     final Color primary = const Color(0xFF0D9488); 
//     final Color bgColor = const Color(0xFFF9FAFB); 
//     final Color textColor = const Color(0xFF111827); 

//     return Scaffold(
//       backgroundColor: bgColor,
//       body: SafeArea(
//         child:  GetBuilder<VerifyCodeRegisterControllerImp>(
//           builder: (controller) => HandlingDataView(
//                 statusRequest: controller.statusRequest,
//                 widget: SingleChildScrollView(
//                   child: Column(
//                               children: [
//                                 const SizedBox(height: 40),
                            
//                                 // Icon or logo
//                                 const Icon(
//                   Icons.verified_user_rounded,
//                   size: 80,
//                   color: Colors.teal,
//                                 ),
                            
//                                 const SizedBox(height: 20),
                            
//                                 // Title
//                                 Text(
//                   'Verify Your Account',
//                   style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: textColor,
//                   ),
//                                 ),
                            
//                                 const SizedBox(height: 8),
                            
//                                 Text(
//                   'We’ve sent a 6-digit verification code\nto your email address.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                                 ),
                            
//                                 const SizedBox(height: 30),
                            
//                                 // OTP Input
                                
//                                 // OtpTextField(
//                                 //   // borderRadius: BorderRadius.circular(20),
//                                 //   borderRadius: BorderRadius.circular(12),
//                                 //   borderColor: primary,
//                                 //   focusedBorderColor: primary,
//                                 //   showFieldAsBox: true,
//                                 //   cursorColor: primary,
//                                 //   fieldWidth: 40.0,
//                                 //   numberOfFields: 6,
                            
//                                 //   onCodeChanged: (String code) {},
//                                 //   onSubmit: (String verificationCode) {
//                                 //     print("Entered OTP: $verificationCode");
//                                 //     // handle verification
//                                 //                               // controller.goToSuccessSignUp();
                  
//                                 //   },
//                                 // ),
//                                  Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: TextFormField(
//                       controller: controller.otpController,
//                       // keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: "Verification Code",
//                         border: const OutlineInputBorder(),
//                         prefixIcon: const Icon(Icons.verified_rounded),
//                         // suffix: _secondsRemaining > 0
//                         //     ? Text("$_secondsRemaining s", style: TextStyle(color: Colors.teal))
//                         //     : TextButton(
//                         //         onPressed: () {
//                         //           _startCountdown();
//                         //           // هنا ترسلي الرمز من جديد
//                         //         },
//                         //         child: const Text("Resend"),
//                         //       ),
//                       ),
//                       // validator: (value) {
//                       //   if (value == null || value.length != 6) {
//                       //     return 'Enter 6-digit code';
//                       //   }
//                       //   return null;
//                       // },
//                     ),
//                                  ),
//                                 const SizedBox(height: 40),
                            
//                                 // Confirm Button
//                                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: ElevatedButton(
//                     onPressed: () {
//                                               controller.goToSuccessSignUp();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primary,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       minimumSize: const Size.fromHeight(50),
//                       elevation: 3,
//                     ),
//                     child: const Text(
//                       'Verify',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                                 ),
                            
//                                 const SizedBox(height: 20),
                            
//                                 // Resend Option
//                                 TextButton(
//                   onPressed: () {
//                     // resend code
//                   },
//                   child: Text(
//                     "Didn't receive the code? Resend",
//                     style: TextStyle(
//                       color: primary,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                     ),
//                   ),
//                                 ),
//                               ],
//                             ),
//                 ),
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/verifycode_register_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_background.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_logo.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/register_widdets.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_container.dart';

class VerifyRegisterScreen extends StatelessWidget {
  const VerifyRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeRegisterControllerImp());

    final Color primary = const Color(0xFF0D9488);

    return Scaffold(
      body: Stack(
        children: [
          CustomBackGround(),
          Center(
            child: SingleChildScrollView(
              child: GetBuilder<VerifyCodeRegisterControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      const SizedBox(height: 40),
                      CustomLogo(),
                      const SizedBox(height: 20),
                      CustomTopText(
                        text1: "Verify Your Account",
                        text2:
                            "Enter the 6-digit verification code sent to your email.",
                      ),
                      const SizedBox(height: 30),
                      CustomMainContainer(
                        height: MediaQuery.of(context).size.height * 0.55,
                        statusRequest: controller.statusRequest,
                        children: [

                            const Icon(
                  Icons.verified_user_rounded,
                  size: 80,
                  color: Colors.blue,
                                ),
                            
                                const SizedBox(height: 20),
                          

                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: controller.otpController,
                              decoration: const InputDecoration(
                                labelText: "Verification Code",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.verified_rounded),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // زر التأكيد
                          CustomBottonAuth(
                            text: "VERIFY",
                            onPressed: () {
                              controller.goToSuccessSignUp();
                            },
                          ),

                          const SizedBox(height: 20),

                          // إعادة إرسال
                          TextButton(
                            onPressed: () {
                              // إعادة إرسال الكود
                            },
                            child: Text(
                              "Didn't receive the code? Resend",
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

