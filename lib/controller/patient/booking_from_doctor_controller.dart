import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/data/model/patient/appointment_model.dart';
import 'package:med_booking_system/view/widgets/patient/show_doctor_profile/show_doctor_profile_by_other.dart';

class BookingController extends GetxController {
  late DoctorModel doctor;

  var selectedCenter = Rxn<CenterModel>();
  var selectedDate = Rxn<DateTime>();
  var selectedTime = ''.obs;

  List<DateTime> availableDates = [];

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments['doctor'];
    if (doctor.centers.isNotEmpty) {
      selectCenter(doctor.centers.first);
    }
  }

  void selectCenter(CenterModel center) {
    selectedCenter.value = center;
    selectedDate.value = null;
    selectedTime.value = "";
    _generateAvailableDates(center);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    selectedTime.value = "";
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  void _generateAvailableDates(CenterModel center) {
    availableDates.clear();

    final today = DateTime.now();
    final weekdaysMap = {
      'Monday': DateTime.monday,
      'Tuesday': DateTime.tuesday,
      'Wednesday': DateTime.wednesday,
      'Thursday': DateTime.thursday,
      'Friday': DateTime.friday,
      'Saturday': DateTime.saturday,
      'Sunday': DateTime.sunday,
    };

    final workingDaysInts =
        center.workingDays.map((day) => weekdaysMap[day]!).toList();

    for (int i = 0; i < 30; i++) {
      final date = today.add(Duration(days: i));
      if (workingDaysInts.contains(date.weekday)) {
        availableDates.add(date);
      }
    }
  }

  List<String> generateAvailableTimes() {
    if (selectedCenter.value == null || selectedDate.value == null) return [];

    final center = selectedCenter.value!;
    final duration = Duration(minutes: doctor.appointmentDuration);

    final List<String> times = [];

    DateTime current = DateTime(
      selectedDate!.value!.year,
      selectedDate!.value!.month,
      selectedDate!.value!.day,
      center.workingStart.hour,
      center.workingStart.minute,
    );

    DateTime endTime = DateTime(
      selectedDate!.value!.year,
      selectedDate!.value!.month,
      selectedDate!.value!.day,
      center.workingEnd.hour,
      center.workingEnd.minute,
    );

    while (current.isBefore(endTime)) {
      times.add(_formatTime(current));
      current = current.add(duration);
    }

    return times;
  }

  String _formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String ampm = 'AM';

    if (hour >= 12) {
      ampm = 'PM';
      if (hour > 12) hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hour:$minuteStr $ampm';
  }

  bool get canConfirm =>
      selectedCenter.value != null &&
      selectedDate.value != null &&
      selectedTime.value.isNotEmpty;

  void confirmBooking() {
    print(
      "تم الحجز بتاريخ ${selectedDate.value} الساعة ${selectedTime.value} في مركز ${selectedCenter.value!.name}",
    );
  }

  
}
