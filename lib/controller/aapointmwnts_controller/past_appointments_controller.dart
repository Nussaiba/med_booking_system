
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/home/doctor_home_data.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';
import '../../core/class/status_request.dart';


class PastAppointmentsController extends GetxController {
  DoctorHomeData homeData = DoctorHomeData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DateTime? selectedDate ;
  List dataDoctorAppointments = [];
  List<DoctorAppointmentModel> doctorAppointmentsList = [];

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }
Future<void> pickDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
  );
  if (picked != null) setDateFilter(picked);
}

  void setDateFilter(DateTime? date) {
    selectedDate = date;
    fetchAppointments(date: date);
    update();

  }

  fetchAppointments({DateTime? date}) async {
    dataDoctorAppointments.clear();
    doctorAppointmentsList.clear();
    statusRequest = StatusRequest.loading;

    String? dateStr;

    if (date != null) {
      print(date);
      dateStr =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    }
    // print(
    //   "===========================$dateStr==================================",
    // );
    var response = await homeData.getPastAppointsmentData(dateStr);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataDoctorAppointments.length}lllllllmmmmmmmmmmlllll");
        dataDoctorAppointments.addAll(response['data']['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        print("lll ${dataDoctorAppointments.length}");
        for (int i = 0; i < dataDoctorAppointments.length; i++) {
          doctorAppointmentsList.add(
            DoctorAppointmentModel.fromJson(dataDoctorAppointments[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
}
