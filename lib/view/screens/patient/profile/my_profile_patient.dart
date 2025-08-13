import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/show_patient_profle_controller.dart';
import 'package:med_booking_system/view/widgets/patient/main_screen_widget/patient_profile_widget.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class PatientProfileScreen extends StatelessWidget {
  final controller = Get.put(ShowPatientProfleController());

  PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 2),
        child: Column(
          children: [
            ProfileHeader(
              name:
                  controller.patientProfileModel?.personal.contactInfo.email ??
                  'not ',
              birthDate: controller.patientProfileModel!.personal!.personalDetails!.birthdate!,
              imageUrl: null,
              isNetworkImage: true,
              onEdit: () {},
              // bloodType: controller.patient.bloodType,
            ),
            buildTabBar(controller),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) => controller.selectedTab.value = index,
                children: [
                  buildPersonalInfo(controller.patientProfileModel!),
                  buildAppointments(controller.patientProfileModel!.appointments.upcoming,controller.patientProfileModel!.appointments!.old ),
                  buildMedicalRecords(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
