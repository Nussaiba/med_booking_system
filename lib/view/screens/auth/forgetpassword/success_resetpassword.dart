// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/core/constants/image_assest.dart';
// import 'package:med_booking_system/core/constants/routes.dart';

// class SuccessResetPasswordScreen extends StatelessWidget {
//   const SuccessResetPasswordScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEFFCF6),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  SvgPicture.asset(
//                             AppImageAsset.enterPassword,
//                             height: 180,
//                           ),
//                 const Icon(
//                   Icons.check_circle_rounded,
//                   size: 100,
//                   color: Colors.teal,
//                 ),
//                 const SizedBox(height: 24),
//                 const Text(
//                   "Password Reset Successfully",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Your password was reset successfully.\nLet’s go tl login.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.black54),
//                 ),
//                 const SizedBox(height: 40),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoute.login);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     minimumSize: const Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                   ),
//                   child: const Text(
//                     "Continue",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/constants/routes.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = Color(0xFF2196F3); // Primary blue color
    final Color lightBlue = Color(0xFFBBDEFB); // Light blue
    final Color darkBlue = Color(0xFF1976D2); // Darker blue

    return Scaffold(
      backgroundColor: Color(0xFFF5F9FF), // Very light blue background
      body: SafeArea(
        child: Stack(
          children: [
            // Animated Background Elements
            Positioned(
              right: -100,
              top: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      primaryBlue.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ).animate(
                onPlay: (controller) => controller.repeat(),
              ).scale(
                duration: 8000.ms,
                begin: const Offset(1, 1),
                end: const Offset(1.2, 1.2),
              ).fade(
                begin: 0.5,
                end: 0.8,
              ),
            ),
            
            // Main Content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Checkmark
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            lightBlue,
                            primaryBlue,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryBlue.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        size: 80,
                        color: Colors.white,
                      ),
                    )
                        .animate()
                        .scale(
                          delay: 300.ms,
                          duration: 600.ms,
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1, 1),
                        )
                        .then()
                        .shake(
                          hz: 4,
                          curve: Curves.easeInOut,
                          duration: 600.ms,
                        ),
                    
                    const SizedBox(height: 40),
                    
                    // Success Message
                    Text(
                      "Password Reset Successfully!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 500.ms,
                        ),
                    
                    const SizedBox(height: 16),
                    
                    // Description Text
                    const Text(
                      "Your password has been updated securely.\nYou can now login with your new credentials.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    )
                        .animate()
                        .fadeIn(
                          delay: 200.ms,
                          duration: 500.ms,
                        ),
                    
                    const SizedBox(height: 50),
                    
                    // Animated Continue Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.login);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 5,
                          shadowColor: primaryBlue.withOpacity(0.4),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue to Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_rounded, size: 22),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                          delay: 400.ms,
                          duration: 500.ms,
                        )
                        .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 500.ms,
                        ),
                  ],
                ),
              ),
            ),
            
            // Floating Confetti Elements
            Positioned(
              top: 100,
              left: 30,
              child: _FloatingConfetti(delay: 0, color: lightBlue),
            ),
            Positioned(
              bottom: 200,
              right: 40,
              child: _FloatingConfetti(delay: 300, color: primaryBlue),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingConfetti extends StatelessWidget {
  final int delay;
  final Color color;
  
  const _FloatingConfetti({required this.delay, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
    )
        .animate(
          delay: Duration(milliseconds: delay),
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .scale(
          duration: 2000.ms,
          begin: const Offset(0.5, 0.5),
          end: const Offset(1.2, 1.2),
        )
        .move(
          begin: const Offset(0, -20),
          end: const Offset(0, 20),
          duration: 3000.ms,
        )
        .fade(
          begin: 0.8,
          end: 0,
        );
  }
}