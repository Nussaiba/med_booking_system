import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/api_link.dart';

import 'package:med_booking_system/controller/doctor/main_doctor_screens/show_doctor_profle_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/screens/doctor/profile/create_doctor_profile.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShowDoctorProfleController());
    return Scaffold(
      body: GetBuilder<ShowDoctorProfleController>(
        builder: (controller) {
          final doctor = controller.doctor?.doctorProfile;
          final user = controller.doctor?.user;

          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 22),
                  ProfileHeader(
                    name: "Dr. ${user?.fullName}",
                    birthDate:user?.birthdate,
                    // imageUrl: user?.profilePhoto,
                    imageUrl: user?.profilePhoto,
                    isNetworkImage: true,
                    onEdit: () {
                      Get.to(CreateDoctorProfileScreen());
                    },
                    age: null,
                  ),

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        buildInfoSection(
                          title: 'General Information',
                          icon: Icons.info_outline,
                          children: [
                            buildInfoItem(
                              Icons.location_on,
                              'Address',
                              user?.address ?? "Not specified",
                            ),
                            buildInfoItem(
                              Icons.person,
                              'Gender',
                              user?.gender ?? "Not specified",
                            ),
                            buildInfoItem(
                              Icons.cake,
                              'Birthdate',
                              user?.birthdate ?? "Not specified",
                            ),

                              buildInfoItem(
                              Icons.person,
                              'About me',
                              doctor?.aboutMe ?? "Not specified",
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        buildInfoSection(
                          title: 'Professional Details',
                          icon: Icons.medical_information_outlined,
                          children: [
                            buildInfoItem(
                              Icons.work,
                              'Years of Experience',
                              doctor?.yearsOfExperience?.toString() ??
                                  "Not specified",
                            ),
                            buildInfoItem(
                              Icons.access_time,
                              'Appointment Duration',
                              "${doctor?.appointmentDuration ?? 'N/A'} mins",
                            ),
                            buildInfoItem(
                              Icons.verified,
                              'Status',
                              doctor?.status ?? "Not specified",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
