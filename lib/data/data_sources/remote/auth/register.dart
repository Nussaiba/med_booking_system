import 'dart:io';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postdata(
    String username,
    String password,
    String email,
    String phone,
    String passwordConfirmation,
    String accountType,
    String gender,
    String birthdate,
    String address,
  ) async {
    print("start postdata");
    print(
      "==========================${AppLink.signup}==============================",
    );
    print(
      "===========$username=========$email======$password====\n==$passwordConfirmation======$phone====$accountType=====\n=====$birthdate=======$gender======$address======",
    );

    var response = await crud.postData(AppLink.signup, {
      "full_name": username,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "role": accountType,
      "gender": gender,
      "birthdate": birthdate,
      "address": address,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  postDoctordata(
    String username,
    String password,
    String email,
    String phone,
    String passwordConfirmation,
    File certificate,
    File? photo,

    String birthdate,
    String gender,

    String address,
    String? aboutMe,
    String? specialtyId,
    String? yearsOfExperience,

    String appointmentDuration,
  ) async {
    print("start postdata");
    print(
      "==========================${AppLink.doctorRegister}==============================",
    );
    print(
      "===========$username=========$email======$password======$passwordConfirmation===\n======$phone====$certificate====\n===$appointmentDuration=====$yearsOfExperience==\n=======$specialtyId===========$aboutMe===\n=======$certificate=======$photo===$birthdate===\n=====$gender===========$address======",
    );

    var response = await crud.postTowFileAndData(
      AppLink.doctorRegister,
      {
        "full_name": username,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "profile_photo": photo,
        "birthdate": birthdate,
        "gender": gender,
        "address": address,
        "about_me": aboutMe,
        "specialty_id": specialtyId,
        "years_of_experience": yearsOfExperience,
        "certificate": certificate,
        "appointment_duration": appointmentDuration,
      },

      "certificate",
      certificate,
      photo,
      "profile_photo",
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
