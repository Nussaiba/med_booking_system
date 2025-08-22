import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class AppointmentsData {
  Crud crud;
  AppointmentsData(this.crud);
  getDoctorAppointmentsByIdData(String id) async {
    print(
      "==========================${AppLink.doctorAppointments}/$id==============================",
    );

    var response = await crud.getData("${AppLink.doctorAppointments}/$id");
    return response.fold((l) => l, (r) => r);
  }

  
}
