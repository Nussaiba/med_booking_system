import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/profile/create_doctor_profile_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/General/custom_text_field.dart';
import 'package:med_booking_system/view/widgets/patient/profile/create_profile_widgets/widgets.dart';

class CreateDoctorProfileScreen extends StatelessWidget {
  const CreateDoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Create Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: GetBuilder<CreateProfileControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    CustomProfileImagePicker(
                      file: controller.profilePhoto,
                      onPickImage: controller.getImage,
                    ),
                    const SizedBox(height: 30),
                    sectionTitle("General Info"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      mycontroller: controller.nameController,
                      hinttext: "Full Name",
                      labeltext: "Full Name",
                      icon: Icons.person,
                      valid: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    dateField(
                      "Birthdate",
                      controller.birthdate,
                      controller.pickBirthdate,
                    ),
                    const SizedBox(height: 14),
                    dropdown(
                      controller.gender,
                      "Gender",
                      controller.genders,
                      (val) => controller.gender = val,
                    ),

                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.yearsExperienceController,
                      hinttext: "Years of Experience",
                      labeltext: "Years of Experience",
                      icon: Icons.work,
                      valid: (value) {
                        return null;
                      },
                    ),

                    const SizedBox(height: 14),

                    certificateFileField(
                      selectedFileName:
                          controller.certificateFile?.path.split('/').last ??
                          "No file selected",
                      onPickFile: controller.chooseCertificateFile,
                    ),

                    const SizedBox(height: 28),
                    sectionTitle("Professional Info"),
                    const SizedBox(height: 12),

                    dropdown(
                      controller.specialty,
                      "Specialty",
                      controller.specialties,
                      (val) => controller.specialty = val,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.addressController,
                      hinttext: "Enter Address",
                      labeltext: "Address",
                      icon: Icons.location_city_rounded,
                      valid: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.appointmentDurationController,
                      hinttext: "Appointment Duration (minutes)",
                      labeltext: "Appointment Duration (minutes)",
                      icon: Icons.house_rounded,
                      valid: (value) {
                        return null;
                      },
                    ),

                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.aboutMe,
                      hinttext: "About Me",
                      labeltext: "About Me",
                      icon: Icons.person,
                      valid: (value) {
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.createProfile();
                        // if (controller.formstate.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Profile Saved')),
                        //   );
                        // }
                      },
                      icon: const Icon(Icons.save_alt),
                      label: const Text("Save Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
