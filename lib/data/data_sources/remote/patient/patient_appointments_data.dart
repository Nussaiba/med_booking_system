import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';
import 'package:path_provider/path_provider.dart';

class PatientAppointmentsData {
  Crud crud;
  PatientAppointmentsData(this.crud);

  getAllAppointmentssData() async {
    print("============================${AppLink.getAppointmentRequests}=============================");
    var response = await crud.getData(AppLink.getAppointmentRequests);
    return response.fold((l) => l, (r) => r);
  }

}
