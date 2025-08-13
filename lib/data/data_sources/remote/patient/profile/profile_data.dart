import 'dart:convert';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class PatientProfileData {
  Crud crud;
  PatientProfileData(this.crud);

  postprofiledata(
    String ?phone,
    String ?adress,
    String ?gender,
    String ?birthdate,
  ) async {
    print(
      "==========================${AppLink.patientProfile}==============================",
    );
    print(
      "====================$phone======$adress=========$gender========$birthdate============",
    );
    var response = await crud.postData(
      AppLink.patientProfile,
      json.encode({
        "phone": phone,
        "adress": adress,
        "gender": gender,
        "birthdate": birthdate,
      }),
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  getPatientProfilerData() async {
    print(
      "================kkkkkkkkkkkkkkkkkkkkkkkk==========${AppLink.patientProfile}==============================",
    );

    var response = await crud.getData(AppLink.patientProfile);
    return response.fold((l) => l, (r) => r);
  }
}
