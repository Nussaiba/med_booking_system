import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class BookingData {
  Crud crud;
  BookingData(this.crud);

  getAppointmentRequests() async {
    print(
      "============================================${AppLink.getAvailableSlots}===============================================",
    );
    var response = await crud.getData(AppLink.getAvailableSlots);
    return response.fold((l) => l, (r) => r);
  }

  requestAppointment(
    String doctorId,
    String centerId,
    String requestedDate,
    String requestedTime,
    String? notes,
  ) async {
    print(
      "==========================${AppLink.requestAppointment}==============================",
    );
    print(
      "====================$doctorId======$centerId=========$requestedDate========$requestedTime============$notes=========",
    );
    var response = await crud.postData(AppLink.requestAppointment, {
      "doctor_id": doctorId,
      "center_id": centerId,
      "requested_date": requestedDate,
      "requested_time": requestedTime,
      "notes": notes,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
