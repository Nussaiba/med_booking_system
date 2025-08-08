import 'package:flutter/material.dart';

class DailyScheduleModel {
  final DateTime date;
  final String dayOfWeek;
  final TimeOfDay workingStart;
  final TimeOfDay workingEnd;
  final List<String> availableSlots;

  DailyScheduleModel({
    required this.date,
    required this.dayOfWeek,
    required this.workingStart,
    required this.workingEnd,
    required this.availableSlots,
  });

  factory DailyScheduleModel.fromJson(Map<String, dynamic> json) {
    final workingHours = json['working_hours'] ?? {};
    return DailyScheduleModel(
      date: DateTime.parse(json['date']),
      dayOfWeek: json['day_of_week'],
      workingStart: _parseTimeOfDay(workingHours['start_time']),
      workingEnd: _parseTimeOfDay(workingHours['end_time']),
      availableSlots: List<String>.from(json['available_slots']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String().split('T').first,
      'day_of_week': dayOfWeek,
      'working_hours': {
        'start_time': _formatTimeOfDay(workingStart),
        'end_time': _formatTimeOfDay(workingEnd),
      },
      'available_slots': availableSlots,
    };
  }

  static TimeOfDay _parseTimeOfDay(String timeStr) {
    final parts = timeStr.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
