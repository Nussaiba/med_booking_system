import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/show_patient_profle_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/class/status_request.dart';
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
                widget:
                    controller.patientProfileModel == null
                        ? _buildEmptyState()
                        : SingleChildScrollView(
                          child: Column(
                            children: [
                              ProfileHeader(
                                name:
                                    controller
                                        .patientProfileModel
                                        ?.personal
                                        ?.contactInfo
                                        .
                                        email.split('@')[0]
                                         ??
                                    'not ',
                                birthDate:
                                    controller
                                        .patientProfileModel
                                        ?.personal
                                        ?.personalDetails
                                        .birthdate,
                                imageUrl: null,
                                isNetworkImage: true,
                                onEdit: () {
                                  Get.to(CreatePatientProfileScreen());
                                },
                                bloodType:
                                    controller
                                        .patientProfileModel
                                        ?.medical
                                        ?.bloodType,
                                age:
                                    controller
                                        .patientProfileModel
                                        ?.personal
                                        ?.personalDetails
                                        .age,
                              ),

                              // buildPersonalInfo(controller.patientProfileModel!),
                              buildPersonalInfo(
                                controller.patientProfileModel!,
                              ),
                              buildMedicalInfo(controller.patientProfileModel!),
                              buildEmergencyInfo(
                                controller.patientProfileModel!,
                              ),
                              buildLifestyleInfo(
                                controller.patientProfileModel!,
                              ),
                              buildFollowUpInfo(
                                controller.patientProfileModel!,
                              ),
                              buildInsuranceInfo(
                                controller.patientProfileModel!,
                              ),
                              buildAppointmentsInfo(
                                controller.patientProfileModel!,
                              ),
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









 Widget _buildEmptyState() {
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(scrollbars: false),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 80,
              color: Colors.blue.shade300,
            ),
            SizedBox(height: 20),
            Text(
              "No Profile Yet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Create your pfofile now",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {

                 Get.to(CreatePatientProfileScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              ),
              child: Text(
                "Creat Profile Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


