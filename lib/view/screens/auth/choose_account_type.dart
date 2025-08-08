import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/choose_acoount_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/view/widgets/choose_account_type/choose_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_container.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_button_auth.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_background.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_logo.dart';

class ChooseAccountType extends StatelessWidget {
  const ChooseAccountType({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ChooseAcoountController());
    return Scaffold(
      body: GetBuilder<ChooseAcoountController>(
                builder:
                    (controller) => Stack(
          children: [
            CustomBackGround(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    CustomLogo(),
                    const SizedBox(height: 30),
                    CustomTopText(
                      text1: "Choose Account Type",
                      text2: "Select your role to continue",
                    ),
        
                    const SizedBox(height: 30),
        
                    CustomMainContainer(
                      statusRequest: StatusRequest.none,

                      children: [
                        const SizedBox(height: 10),
        
                        buildRoleCard(
                          role: controller.doctorRole,
                          title: 'Doctor',
                          description: 'Manage appointments and patients',
                          icon: Icons.medical_services,
                          selectedRole: controller.selectedRole,
                          onTap:(){ controller.updateChoosenType(controller.doctorRole);}
                        ),
        
                        const SizedBox(height: 20),
        
                        buildRoleCard(
                          role:controller.patientRole ,
                          title: 'Patient',
                          description: 'Book appointments easily',
                          icon: Icons.person,
                          selectedRole: controller.selectedRole,
                          onTap:(){ controller.updateChoosenType(controller.patientRole);}
                        ),
        
                        const SizedBox(height: 30),
        
                        if (controller.selectedRole != null)
                          CustomBottonAuth(
                            text: "Continue",
                            onPressed: controller.goToRegister,
                          ),
                      ],
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