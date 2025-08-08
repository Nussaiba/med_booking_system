import 'package:flutter/material.dart';
import 'package:med_booking_system/data/model/all_model.dart';

List<String> generateAvailableSlots({
  required CenterModel center,
  required DoctorModel doctor,
  required DateTime date,
  required List<String> bookedSlots, // قائمة الأوقات المحجوزة مثل ["09:00 AM", "10:30 AM"]
}) {
  List<String> slots = [];

  // أولاً: تأكد أن اليوم المختار هو ضمن أيام دوام المركز
  String dayName = _getDayName(date.weekday); // Monday, Tuesday, ...

  if (!center.workingDays.contains(dayName)) {
    return slots;  // فارغة لأنه يوم عطلة
  }

  // حساب الوقت الحالي باليوم المختار
  DateTime startDateTime = DateTime(date.year, date.month, date.day,
      center.workingStart.hour, center.workingStart.minute);

  DateTime endDateTime = DateTime(date.year, date.month, date.day,
      center.workingEnd.hour, center.workingEnd.minute);

  while (startDateTime.isBefore(endDateTime)) {
    // تنسيق الوقت للنص (مثلاً 09:00 AM)
    String slotText = _formatTimeOfDay(
        TimeOfDay(hour: startDateTime.hour, minute: startDateTime.minute));

    if (!bookedSlots.contains(slotText)) {
      slots.add(slotText);
    }

    // زيادة الوقت حسب مدة الموعد عند الدكتور
    startDateTime = startDateTime.add(Duration(minutes: doctor.appointmentDuration));
  }

  return slots;
}

// دالة مساعدة لتحويل int to weekday name
String _getDayName(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return "Monday";
    case DateTime.tuesday:
      return "Tuesday";
    case DateTime.wednesday:
      return "Wednesday";
    case DateTime.thursday:
      return "Thursday";
    case DateTime.friday:
      return "Friday";
    case DateTime.saturday:
      return "Saturday";
    case DateTime.sunday:
      return "Sunday";
    default:
      return "";
  }
}

// دالة مساعدة لتحويل TimeOfDay لنص 12 ساعة (مثلاً 09:00 AM)
String _formatTimeOfDay(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
