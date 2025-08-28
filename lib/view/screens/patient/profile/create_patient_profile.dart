import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/profile/create_patient_profile_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/General/custom_text_field.dart';
import 'package:med_booking_system/view/widgets/patient/profile/create_profile_widgets/widgets.dart';

class CreatePatientProfileScreen extends StatelessWidget {
  const CreatePatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreatePatientProfileControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Create Patient Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: GetBuilder<CreatePatientProfileControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صورة المريض
                    CustomProfileImagePicker(
                      file: controller.profilePhoto,
                      onPickImage: controller.getImage,
                    ),
                    const SizedBox(height: 30),

                    // Personal Info
                    sectionTitle("Personal Info"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      mycontroller: controller.fullNameController,
                      hinttext: "Full Name",
                      labeltext: "Full Name",
                      icon: Icons.person,
                      valid: (value) => null,
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
                      mycontroller: controller.emailController,
                      hinttext: "Email",
                      labeltext: "Email",
                      icon: Icons.email,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.phoneController,
                      hinttext: "Phone Number",
                      labeltext: "Phone Number",
                      icon: Icons.phone,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.addressController,
                      hinttext: "Address",
                      labeltext: "Address",
                      icon: Icons.location_on,
                      valid: (value) => null,
                    ),

                    const SizedBox(height: 28),

                    // Medical Info
                    sectionTitle("Medical Info"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      mycontroller: controller.conditionController,
                      hinttext: "Medical Condition",
                      labeltext: "Condition",
                      icon: Icons.local_hospital,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.medicalHistoryController,
                      hinttext: "Medical History",
                      labeltext: "Medical History",
                      icon: Icons.history,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.allergiesController,
                      hinttext: "Allergies",
                      labeltext: "Allergies",
                      icon: Icons.warning,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.currentMedicationsController,
                      hinttext: "Current Medications",
                      labeltext: "Current Medications",
                      icon: Icons.medical_services,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.familyHistoryController,
                      hinttext: "Family Medical History",
                      labeltext: "Family History",
                      icon: Icons.family_restroom,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    dropdown(
                      controller.bloodType,
                      "Blood Type",
                      controller.bloodTypes,
                      (val) => controller.bloodType = val,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.heightController,
                      hinttext: "Height (cm)",
                      labeltext: "Height",
                      icon: Icons.height,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.weightController,
                      hinttext: "Weight (kg)",
                      labeltext: "Weight",
                      icon: Icons.monitor_weight,
                      valid: (value) => null,
                    ),

                    const SizedBox(height: 28),

                    // Emergency Contact
                    sectionTitle("Emergency Contact"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      mycontroller: controller.emergencyNameController,
                      hinttext: "Contact Name",
                      labeltext: "Contact Name",
                      icon: Icons.person,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.emergencyPhoneController,
                      hinttext: "Contact Phone",
                      labeltext: "Contact Phone",
                      icon: Icons.phone,
                      valid: (value) => null,
                    ),

                    const SizedBox(height: 28),

                    // Lifestyle
                    sectionTitle("Lifestyle"),
                    const SizedBox(height: 12),
                    dropdown(
                      controller.smokingStatus,
                      "Smoking Status",
                      controller.smokingOptions,
                      (val) => controller.smokingStatus = val,
                    ),
                    const SizedBox(height: 14),
                    dropdown(
                      controller.alcoholConsumption,
                      "Alcohol Consumption",
                      controller.alcoholOptions,
                      (val) => controller.alcoholConsumption = val,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.lifestyleNotesController,
                      hinttext: "Lifestyle Notes",
                      labeltext: "Lifestyle Notes",
                      icon: Icons.sports,
                      valid: (value) => null,
                    ),

                    const SizedBox(height: 28),

                    // Insurance
                    sectionTitle("Insurance Info"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      mycontroller: controller.insuranceProviderController,
                      hinttext: "Insurance Provider",
                      labeltext: "Provider",
                      icon: Icons.business,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      mycontroller: controller.insuranceNumberController,
                      hinttext: "Insurance Number",
                      labeltext: "Insurance Number",
                      icon: Icons.confirmation_number,
                      valid: (value) => null,
                    ),
                    const SizedBox(height: 14),
                    dateField(
                      "Insurance Expiry",
                      controller.insuranceExpiry,
                      controller.pickInsuranceExpiry,
                    ),

                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.createProfile();
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
