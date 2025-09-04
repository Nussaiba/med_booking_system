import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/booking_data.dart';
import 'package:med_booking_system/data/model/patient/appointment_model.dart';

class BookingFromCenterController extends GetxController {
  BookingData data = BookingData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List dataAppointments = [];
  List<AppointmentModel> appointmentsList = [];

  getAppointments(String doctorId, String centerId) async {
    dataAppointments.clear();
    appointmentsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAppointmentRequests();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataAppointments.length}lllllllmmmmmmmmmmlllll");
        dataAppointments.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataAppointments.length}");
        for (int i = 0; i < dataAppointments.length; i++) {
          appointmentsList.add(AppointmentModel.fromJson(dataAppointments[i]));
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  requestAppointment(
    String doctorId,
    String centerId,
    String requestedDate,
    String requestedTime,
    String? notes,
  ) async {
    // if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.requestAppointment(
      doctorId,
      centerId,
      requestedDate,
      requestedTime,
      notes,
    );

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.offAllNamed(AppRoute.mainPatientScreen);
      }
    }
  }
}
