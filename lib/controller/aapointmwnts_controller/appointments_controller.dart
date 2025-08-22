import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/appointments_data.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';

class DoctorAppointmentDetailController extends GetxController {
  AppointmentsData data = AppointmentsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  DoctorAppointmentModel? appointmentModel;
  late String appointementId;
  getDoctorAppointmentsDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await data.getDoctorAppointmentsByIdData(appointementId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        // statusRequest = StatusRequest.loading;

        appointmentModel = DoctorAppointmentModel.fromJson(response['data']);

        print(" appointmentModel  $appointmentModel");
        update();
        return appointmentModel;
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    appointementId = Get.arguments['appointment_id'].toString();
    getDoctorAppointmentsDetails();
    super.onInit();
  }
}
