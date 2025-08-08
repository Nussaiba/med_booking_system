import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/profile/create_patient_profile_controller.dart';
import 'package:med_booking_system/view/widgets/General/custom_text_field.dart';
import 'package:med_booking_system/view/widgets/patient/profile/create_profile_widgets/widgets.dart';

class CreatePatientProfileScreen extends StatelessWidget {
  const CreatePatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePatientProfileControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Create Patient Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Form(
        key: controller.formstate,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              CustomProfileImagePicker(
                file: controller.profilePhoto,
                onPickImage: controller.getImage,
              ),

              const SizedBox(height: 30),
              sectionTitle("Personal Information"),
              const SizedBox(height: 12),
              dateField(
                "Birthdate",
                controller.birthdate,
                controller.pickBirthdate,
              ),
              const SizedBox(height: 14),
              dropdown(controller.gender, "Gender", [
                'Male',
                'Female',
              ], (val) => controller.gender = val),
              const SizedBox(height: 14),
              CustomTextField(
                mycontroller: controller.phoneController,
                hinttext: "Enter Phone",
                labeltext: "Phone",
                icon: Icons.phone,
                valid: (value) {
                  return null;
                },
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
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  if (controller.formstate.currentState!.validate()) {
                    // controller.submitProfile(); // تنفذ حفظ البيانات
                  }
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
  }
}
