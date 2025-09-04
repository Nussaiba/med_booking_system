import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/auth/doctor_register_controller.dart';
import 'package:med_booking_system/core/functions/validinput.dart';
import 'package:med_booking_system/view/widgets/auth_widgets/register_widdets.dart';


Widget buildBasicInfoPage(DoctorRegisterControllerImp controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CustomTitle(title: "Basic Information"),
      const SizedBox(height: 20),

      Center(
        child: GestureDetector(
          onTap: controller.getImage,
          child: CircleAvatar(
            radius: 36,
            backgroundImage:
                controller.profilePhoto != null ? FileImage(controller.profilePhoto!) : null,
            child: controller.profilePhoto == null
                ? const Icon(Icons.camera_alt, size: 32, color: Colors.white70)
                : null,
          ),
        ),
      ),
        const SizedBox(height: 10),


      buildTextFormField(
        Icons.person,
        "Enter your full name",
        "Full Name",
        null,
        controller.username,
        null,
        null,
        (value) => value == null || value.isEmpty ? "Name is required" : null,
        keyboardType: TextInputType.text,
      ),

      buildTextFormField(
        Icons.email,
        "Enter your email",
        "Email",
        null,
        controller.email,
        null,
        null,
        (value) =>
            value == null || !value.contains("@") ? "Invalid email" : null,
        keyboardType: TextInputType.emailAddress,
      ),

      buildTextFormField(
        Icons.phone,
        "Enter your phone",
        "Phone",
        null,
        controller.phone,
        null,
        null,
        (value) =>
            value == null || value.isEmpty ? "Phone is required" : null,
        keyboardType: TextInputType.phone,
      ),
    ],
  );
}

// -------------------- صفحة الأمان --------------------
Widget buildAccountSecurityPage(DoctorRegisterControllerImp controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const CustomTitle(title: "Account Security"),
      const SizedBox(height: 20),

      buildTextFormField(
        Icons.lock,
        "Enter your password",
        "Password",
        controller.isShowPassword ? Icons.visibility : Icons.visibility_off,
        controller.password,
        controller.isShowPassword,
        () => controller.showPassWord(),
        (value) => isPasswordCompliant(value!),
        keyboardType: TextInputType.text,
      ),

      buildTextFormField(
        Icons.lock,
        "Confirm your password",
        "Confirm Password",
        controller.isShowRePassword ? Icons.visibility : Icons.visibility_off,
        controller.repassword,
        controller.isShowRePassword,
        () => controller.showRePassWord(),
        (value) => isPasswordCompliant(value!),
        keyboardType: TextInputType.text,
      ),
    ],
  );
}

// -------------------- صفحة معلومات مهنية --------------------
Widget buildProfessionalInfoPage(DoctorRegisterControllerImp controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const CustomTitle(title: "Professional Information"),
      const SizedBox(height: 20),

      buildDropdownFormField(
        "Specialty",
        controller.specialty,
        controller.specialties,
        (val) => controller.onSpecialtyChanged(val),
      ),

      buildTextFormField(
        Icons.timeline,
        "Years of experience",
        "Experience",
        null,
        controller.yearsOfExperience,
        null,
        null,
        (v) => v == null || v.isEmpty ? "Required" : null,
        keyboardType: TextInputType.number,
      ),

      buildTextFormField(
        Icons.schedule,
        "Appointment duration (min)",
        "Duration",
        null,
        controller.appointmentDuration,
        null,
        null,
        (v) => v == null || v.isEmpty ? "Required" : null,
        keyboardType: TextInputType.number,
      ),

      const SizedBox(height: 20),

      buildCertificateUploader(controller)

    ],
  );
}



Widget buildPersonalInfoPage(DoctorRegisterControllerImp controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const CustomTitle(title: "Personal Information"),
    
      const SizedBox(height: 20),

      buildDateFormField(
        "Birth Date",
        controller.birthdate,
        controller.pickBirthdate,
      ),

      buildDropdownFormField(
        "Gender",
        controller.gender,
        controller.genders,
        (val) {
          controller.gender = val;
          controller.update();
        },
      ),

      buildTextFormField(
        Icons.home,
        "Enter your address",
        "Address",
        null,
        controller.address,
        null,
        null,
        (v) => v == null || v.isEmpty ? "Required" : null,
        keyboardType: TextInputType.text,
      ),

      buildTextFormField(
        Icons.info,
        "Tell us about yourself",
        "About Me",
        null,
        controller.aboutMe,
        null,
        null,
        null,
        
        keyboardType: TextInputType.multiline,
      ),
    ],
  );
}

// -------------------- PageView الرئيسي --------------------
class DoctorRegisterPageView extends GetView<DoctorRegisterControllerImp> {
  const DoctorRegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) => controller.onPageChanged(index),
      children: [
        buildBasicInfoPage(controller),
        buildAccountSecurityPage(controller),
        buildProfessionalInfoPage(controller),
        buildPersonalInfoPage(controller),
      ],
    );
  }
}




Widget buildCertificateUploader(DoctorRegisterControllerImp controller) {
  return GestureDetector(
    onTap: controller.chooseCertificateFile,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200, width: 1.2),
      ),
      child: Row(
        children: [
          Icon(
            controller.certificateFile != null ? Icons.check_circle : Icons.upload_file,
            color: controller.certificateFile != null ? Colors.blue.shade700 : Colors.blue.shade400,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              controller.certificateFile?.path.split('/').last ?? "No file selected",
              style: TextStyle(
                color: controller.certificateFile != null ? Colors.blue.shade900 : Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Upload",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ),
  );

}
class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
