import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/show_patient_profle_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/screens/patient/profile/create_patient_profile.dart';
import 'package:med_booking_system/view/widgets/patient/main_screen_widget/patient_profile_widget.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class PatientProfileScreen extends StatelessWidget {
  final controller = Get.put(ShowPatientProfleController());
  PatientProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GetBuilder<ShowPatientProfleController>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeader(
                        name:
                            controller
                                .patientProfileModel
                                ?.personal
                                .contactInfo
                                .email ??
                            'not ',
                        birthDate:
                            controller
                                .patientProfileModel
                                ?.personal
                                .personalDetails
                                .birthdate,
                        imageUrl: null,
                        isNetworkImage: true,
                        onEdit: () {
                          Get.to(CreatePatientProfileScreen());
                        },
                        bloodType:
                            controller.patientProfileModel?.medical.bloodType,
                        age:
                            controller
                                .patientProfileModel
                                ?.personal
                                .personalDetails
                                .age,
                      ),

                      // buildPersonalInfo(controller.patientProfileModel!),
                      buildPersonalInfo(controller.patientProfileModel!),
                      buildMedicalInfo(controller.patientProfileModel!),
                      buildEmergencyInfo(controller.patientProfileModel!),
                      buildLifestyleInfo(controller.patientProfileModel!),
                      buildFollowUpInfo(controller.patientProfileModel!),
                      buildInsuranceInfo(controller.patientProfileModel!),
                      buildAppointmentsInfo(controller.patientProfileModel!),
                      buildReportsInfo(controller.patientProfileModel!),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
