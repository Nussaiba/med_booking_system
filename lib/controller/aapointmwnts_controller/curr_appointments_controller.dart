import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/home/doctor_home_data.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';
import '../../core/class/status_request.dart';


class CurrentAppointmentsController extends GetxController {
  DoctorHomeData homeData = DoctorHomeData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  DateTime? selectedDate;
  List<DoctorAppointmentModel> appointmentsList = [];
  List<DoctorAppointmentModel> filteredAppointments = [];

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
    applyFilter();
    update();
  }

  void showTodayAppointments() {
    selectedDate = DateTime.now();
    applyFilter();
    update();
  }

  
  fetchAppointments() async {
    appointmentsList.clear();
    filteredAppointments.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.getAppointsmentData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        appointmentsList = (response['data']['data'] as List)
            .map((e) => DoctorAppointmentModel.fromJson(e))
            .toList();
        applyFilter(); 
      }
      update();
    }
  }

  void applyFilter() {
    if (selectedDate == null) {
      filteredAppointments = List.from(appointmentsList);
    } else {
      filteredAppointments = appointmentsList.where((appt) {
        final apptDate = appt.appointmentDate;
        
        return apptDate.year == selectedDate!.year &&
            apptDate.month == selectedDate!.month &&
            apptDate.day == selectedDate!.day;
      }).toList();
    }
    for (var e in filteredAppointments) {
      print(e.id);
    }
  
    update();
  }

  
  void onAppointmentTap(DoctorAppointmentModel appt) {
   
    print("Tapped appointment: ${appt.id}");
  }
}
