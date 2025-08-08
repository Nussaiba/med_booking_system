import 'dart:io';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class CreateDoctorProfileData {
  Crud crud;
  CreateDoctorProfileData(this.crud);

  createPostdata(
    String birthdate,
    String gender,
    File? image,
    String address,
    String? aboutMe,
    String? specialtyId,
    String? yearsOfExperience,
    File? certificate,
    String appointmentDuration,
  ) async {
    print(
      "==========================${AppLink.doctorProfile}==============================",
    );
    print(
      "===============$birthdate==$gender====$address===$aboutMe====$specialtyId===$yearsOfExperience====$appointmentDuration===================================================",
    );

    var response = await crud.postFileAndData(
      AppLink.doctorProfile,
      {
        "birthdate": birthdate,
        "gender": gender,
        "address": address,
        "about_me": aboutMe,
        "specialty_id": specialtyId,
        "years_of_experience": yearsOfExperience,
        "certificate": certificate,
        "appointment_duration": appointmentDuration,
      },
      'profile_photo',
      image,
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
