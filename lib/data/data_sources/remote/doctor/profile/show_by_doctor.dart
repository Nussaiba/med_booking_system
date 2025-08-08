import 'dart:io';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class DoctorProfileByDoctorData {
  Crud crud;
  DoctorProfileByDoctorData(this.crud);

  getDoctorProfileByDoctorData() async {
    var response = await crud.getData(AppLink.doctorProfile);
    return response.fold((l) => l, (r) => r);
  }

  createPostdata(
    String? name,
    String? birthdate,
    String? gender,
    File? image,
    String? address,
    String? aboutMe,
    String? specialtyId,
    String? yearsOfExperience,
    File? certificate,
    String? appointmentDuration,
  ) async {
    print(
      "==========================${AppLink.doctorProfile}==============================",
    );
    print(
      "====name===$name==\n==birthdate====$birthdate=====gender==$gender=\n========address===$address======aboutMe==$aboutMe==\n=======specialtyId====$specialtyId==========yearsOfExperience==$yearsOfExperience==\n======appointmentDuration===$appointmentDuration==============\n===certificate==$certificate==========\n==image=$image===================",
    );

    var response = await crud.postTowFileAndData(
      AppLink.doctorProfile,
      {
        "full_name": name,

        "gender": gender ?? '',
        "birthdate": birthdate ?? '',
        "address": address,

        "about_me": aboutMe,
        "years_of_experience": yearsOfExperience,
        "specialty_id": specialtyId,

        
        "appointment_duration": appointmentDuration,
        "certificate": certificate?? '',
      },
      'profile_photo',
      image, certificate,
      'certificate',
     
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
