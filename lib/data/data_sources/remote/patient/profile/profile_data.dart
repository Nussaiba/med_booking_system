import 'dart:convert';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class PatientProfileData {
  Crud crud;
  PatientProfileData(this.crud);
  postPatientProfileData({
    String? phone,
    String? address,
    String? gender,
    String? birthdate,
    // Medical Info
    String? condition,
    String? medicalHistory,
    String? allergies,
    String? currentMedications,
    String? familyMedicalHistory,
    String? bloodType,
    int? height,
    int? weight,

    // Emergency Contact
    String? emergencyContactName,
    String? emergencyContactPhone,

    // Lifestyle
    String? smokingStatus,
    String? alcoholConsumption,
    String? lifestyleNotes,

    // // Visits
    // String? lastVisit,
    // String? nextFollowUp,
    // String? treatmentNotes,

    // Language
    String? preferredLanguage,

    // Insurance
    String? insuranceProvider,
    String? insuranceNumber,
    String? insuranceExpiry,

    // Profile Status
    String? status,
  }) async {
    print(
      "==========================${AppLink.patientProfile}==============================",
    );
    // var body = {
    //   "phone": phone,
    //   "address": address,
    //   "gender": gender,
    //   "birthdate": birthdate,
    //   "condition": condition,
    //   "medical_history": medicalHistory,
    //   "allergies": allergies,
    //   "current_medications": currentMedications,
    //   "family_medical_history": familyMedicalHistory,
    //   "blood_type": bloodType,
    //   "height": height,
    //   "weight": weight,
    //   "emergency_contact_name": emergencyContactName,
    //   "emergency_contact_phone": emergencyContactPhone,
    //   "smoking_status": smokingStatus,
    //   "alcohol_consumption": alcoholConsumption,
    //   "lifestyle_notes": lifestyleNotes,
    //   // "last_visit": lastVisit,
    //   // "next_follow_up": nextFollowUp,
    //   // "treatment_notes": treatmentNotes,
    //   "preferred_language": preferredLanguage,
    //   "insurance_provider": insuranceProvider,
    //   "insurance_number": insuranceNumber,
    //   "insurance_expiry": insuranceExpiry,
    //   "status": status,
    // };

    final fields = {
      "phone": phone,
      "address": address,
      "gender": gender,
      "birthdate": birthdate,
      "condition": condition,
      "medical_history": medicalHistory,
      "allergies": allergies,
      "current_medications": currentMedications,
      "family_medical_history": familyMedicalHistory,
      "blood_type": bloodType,
      "height": height,
      "weight": weight,
      "emergency_contact_name": emergencyContactName,
      "emergency_contact_phone": emergencyContactPhone,
      "smoking_status": smokingStatus,
      "alcohol_consumption": alcoholConsumption,
      "lifestyle_notes": lifestyleNotes,
      // "last_visit": lastVisit,
      // "next_follow_up": nextFollowUp,
      // "treatment_notes": treatmentNotes,
      "preferred_language": preferredLanguage,
      "insurance_provider": insuranceProvider,
      "insurance_number": insuranceNumber,
      "insurance_expiry": insuranceExpiry,
      "status": status,
    };

    var body = <String, dynamic>{};

    fields.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        body[key] = value;
      }
    });

    print(
      "==================== Sending Patient Profile Data ====================",
    );
    print("===========================body==================================");
    print(body);

    var response = await crud.putData(
      AppLink.patientProfile,
      json.encode(body),
    );
    print("Response from API: $response");

    return response.fold((l) => l, (r) => r);
  }

  getPatientProfilerData() async {
    print(
      "==========================${AppLink.patientProfile}==============================",
    );

    var response = await crud.getData(AppLink.patientProfile);
    return response.fold((l) => l, (r) => r);
  }
}
