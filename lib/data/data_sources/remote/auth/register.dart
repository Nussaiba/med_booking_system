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
  ) async {
    print("start postdata");
    print(
      "==========================${AppLink.signup}==============================",
    );
    print(
      "===========$username=========$email======$password======$passwordConfirmation=========$phone====$accountType===========",
    );

    var response = await crud.postData(AppLink.signup, {
      "full_name": username,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "role": accountType,
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
  ) async {
    print("start postdata");
    print(
      "==========================${AppLink.doctorRegister}==============================",
    );
    print(
      "===========$username=========$email======$password======$passwordConfirmation=========$phone====$certificate===========",
    );

    var response = await crud.postFileAndData(
      AppLink.doctorRegister,
      {
        "full_name": username,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },

      "certificate",
      certificate,
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
