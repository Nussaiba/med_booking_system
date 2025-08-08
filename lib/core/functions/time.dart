import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hourOfPeriod.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return "$hour:$minute $period";
}
