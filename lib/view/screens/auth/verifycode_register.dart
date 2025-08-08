import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/verifycode_register_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';

class VerifyCodeRegister extends StatelessWidget {
  const VerifyCodeRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeRegisterControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: AppColor.PraimaryColor(),
      //   elevation: 0.0,
      //   title: Text(
      //     "27".tr,
      //     style: TextStyle(color: AppColor.white),
      //         ),
      //         iconTheme: IconThemeData(color: AppColor.white),
      // ),
      // body: GetBuilder<VerifyCodeRegisterControllerImp>(
      //     builder: (controller) => HandlingDataRequest(
      //           statusRequest: controller.statusRequest,
      //           widget: Container(
      //               padding: const EdgeInsets.symmetric(
      //                   vertical: 15, horizontal: 30),
      //               child: ListView(children: [
      //                 CustomTextTitle(
      //                   text: "28".tr,
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 CustomTextBody(text: "237".tr),
      //                 const SizedBox(
      //                   height: 15,
      //                 ),
      //                 Center(child: Image.asset(AppImageAsset.otp)),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 OtpTextField(
      //                   borderRadius: BorderRadius.circular(20),
      //                   focusedBorderColor: AppColor.PraimaryColor(),
      //                   cursorColor: AppColor.Grey(),
      //                   enabledBorderColor: AppColor.Grey(),
      //                   fieldWidth: 42.0,
      //                   numberOfFields: 6,
      //                   borderColor: const Color.fromARGB(255, 129, 45, 168),
      //                   showFieldAsBox: true,
      //                   onCodeChanged: (String code) {},
      //                   onSubmit: (String verificationCode) {
      //                     controller.goToSuccessSignUp(verificationCode);
      //                   },
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 GetBuilder<VerifyCodeRegisterControllerImp>(
      //                   builder: (controller) => InkWell(
      //                     onTap: controller.remainingTime == 0
      //                         ? controller.resendCode
      //                         : null,
      //                     child: Text(
      //                       textAlign: TextAlign.end,
      //                       controller.remainingTime > 0
      //                           ? " ${"30".tr} ${controller.timerText}"
      //                           : "31".tr,
      //                       style: TextStyle(
      //                           color: controller.remainingTime > 0
      //                               ? AppColor.grey
      //                               : AppColor.praimaryColor,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                 ),
      //               ])),
      //         ))
    );
  }
}

class VerifyRegisterScreen extends StatelessWidget {
  const VerifyRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(VerifyCodeRegisterControllerImp());

    final Color primary = const Color(0xFF0D9488); // teal-600
    final Color bgColor = const Color(0xFFF9FAFB); // soft gray
    final Color textColor = const Color(0xFF111827); // gray-900

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:  GetBuilder<VerifyCodeRegisterControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SingleChildScrollView(
                  child: Column(
                              children: [
                                const SizedBox(height: 40),
                            
                                // Icon or logo
                                const Icon(
                  Icons.verified_user_rounded,
                  size: 80,
                  color: Colors.teal,
                                ),
                            
                                const SizedBox(height: 20),
                            
                                // Title
                                Text(
                  'Verify Your Account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                                ),
                            
                                const SizedBox(height: 8),
                            
                                Text(
                  'We’ve sent a 6-digit verification code\nto your email address.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                                ),
                            
                                const SizedBox(height: 30),
                            
                                // OTP Input
                                
                                // OtpTextField(
                                //   // borderRadius: BorderRadius.circular(20),
                                //   borderRadius: BorderRadius.circular(12),
                                //   borderColor: primary,
                                //   focusedBorderColor: primary,
                                //   showFieldAsBox: true,
                                //   cursorColor: primary,
                                //   fieldWidth: 40.0,
                                //   numberOfFields: 6,
                            
                                //   onCodeChanged: (String code) {},
                                //   onSubmit: (String verificationCode) {
                                //     print("Entered OTP: $verificationCode");
                                //     // handle verification
                                //                               // controller.goToSuccessSignUp();
                  
                                //   },
                                // ),
                                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: TextFormField(
                      controller: controller.otpController,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Verification Code",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.verified_rounded),
                        // suffix: _secondsRemaining > 0
                        //     ? Text("$_secondsRemaining s", style: TextStyle(color: Colors.teal))
                        //     : TextButton(
                        //         onPressed: () {
                        //           _startCountdown();
                        //           // هنا ترسلي الرمز من جديد
                        //         },
                        //         child: const Text("Resend"),
                        //       ),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.length != 6) {
                      //     return 'Enter 6-digit code';
                      //   }
                      //   return null;
                      // },
                    ),
                                 ),
                                const SizedBox(height: 40),
                            
                                // Confirm Button
                                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: () {
                                              controller.goToSuccessSignUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Verify',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                                ),
                            
                                const SizedBox(height: 20),
                            
                                // Resend Option
                                TextButton(
                  onPressed: () {
                    // resend code
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
                ),
        ),
      ),
    ));
  }
}
