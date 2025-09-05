import 'dart:convert';

import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  ratingDoctorData(String appointmentId, String score, String comment) async {
    print(
      "=======================${AppLink.ratingsDoctor}===================================",
    );
    var response = await crud.postData(
      AppLink.ratingsDoctor,
      json.encode({
        "appointment_id": appointmentId,
        "score": score,
        "comment": comment,
      }),
    );
    return response.fold((l) => l, (r) => r);
  }

  ratingCenterData(String appointmentId, String score, String comment) async {
    print(
      "=======================${AppLink.ratingsCenter}===================================",
    );
     print(
      "==========$appointmentId============$score==============$comment======================",
    );
    var response = await crud.postData(
      AppLink.ratingsCenter,
      json.encode({
        "appointment_id": appointmentId,
        "score": score,
        "comment": comment,
      },
      ),
      addContentType: true
    );
    return response.fold((l) => l, (r) => r);
  }




getDoctorRatingsData(String doctorId) async {
    print(
      "=================================${AppLink.getratingsCenter}/$doctorId========================================",
    );
    var response = await crud.getData("${AppLink.getratingsCenter}/$doctorId");
    return response.fold((l) => l, (r) => r);
  }



getCenterRatingsData(String centerId) async {
    print(
      "=================================${AppLink.getratingsCenter}/$centerId========================================",
    );
    var response = await crud.getData("${AppLink.getratingsCenter}/$centerId");
    return response.fold((l) => l, (r) => r);
  }




}
