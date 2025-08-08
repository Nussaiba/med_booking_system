import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/auth/doctor_register_controller.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/custom_text_field_auth.dart';

class DoctorRegisterPageView extends GetView<DoctorRegisterControllerImp> {
  const DoctorRegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        controller.onPageChanged(index);
      },
      children: [buildBasicInfoPage(controller), buildAdditionalInfoPage( controller)],
    );
  }
}

Widget buildBasicInfoPage(DoctorRegisterControllerImp controller) {
  return Column(
    children: [
      buildTextFormField(
        Icons.person,
        "Enter your full name",
        "Full Name",
        null,
        controller.username,
        null,
        null,
        (value) {
          if (value == null || value.isEmpty) return "Name is required";
          return null;
        },
      ),
      buildTextFormField(
        Icons.email,
        "Enter your email",
        "Email",
        null,
        controller.email,
        null,
        null,
        (value) {
          if (value == null || !value.contains("@")) return "Invalid email";
          return null;
        },
      ),
      buildTextFormField(
        Icons.phone,
        "Enter your phone",
        "Phone",
        null,
        controller.phone,
        null,
        null,
        (value) {
          if (value == null || value.isEmpty) return "Phone is required";
          return null;
        },
      ),
      buildTextFormField(
        Icons.lock,
        "Enter your password",
        "Password",
        Icons.visibility_off,
        controller.password,
        false,
        () {},
        (value) {
          if (value == null || value.length < 6) return "Password too short";
          return null;
        },
      ),
      buildTextFormField(
        Icons.lock,
        "Confirm your password",
        "Confirm Password",
        Icons.visibility_off,
        controller.repassword,
        false,
        () {},
        (value) {
          if (value != controller.password.text)
            return "Passwords do not match";
          return null;
        },
      ),
    ],
  );
}

Widget buildAdditionalInfoPage(DoctorRegisterControllerImp controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// اختيار التخصص
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: "Specialty",
            border: OutlineInputBorder(),
          ),
          value: controller.selectedSpecialty,
          items: controller.specialties
              .map(
                (spec) => DropdownMenuItem(value: spec, child: Text(spec)),
              )
              .toList(),
          onChanged: (val) {
            controller.onSpecialtyChanged(val);
          },
          validator: (value) {
            if (value == null) return "Please select a specialty";
            return null;
          },
        ),
      ),

      const SizedBox(height: 20),

      /// اختيار الشهادة كملف
      const Text(
        "Upload your certificate (PDF, JPG, etc.)",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          ElevatedButton.icon(
            onPressed: controller.chooseCertificateFile,
            icon: const Icon(Icons.upload_file),
            label: const Text("Choose File"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              foregroundColor: Colors.blue.shade900,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              controller.certificateFile?.path.split('/').last ?? "No file selected",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: controller.certificateFile == null ? Colors.grey : Colors.black87,
              ),
            ),
          ),
        ],
      ),

      // يمكن لاحقاً تضيفي زر عرض الملف
      if (controller.certificateFile != null)
        TextButton.icon(
          onPressed: () {
            // open file preview or view pdf
          },
          icon: const Icon(Icons.remove_red_eye, size: 18),
          label: const Text("View"),
        ),
    ],
  );
}
