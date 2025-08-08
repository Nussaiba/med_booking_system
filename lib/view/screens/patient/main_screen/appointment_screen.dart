import 'package:flutter/material.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/appointement_card.dart';


class AppointmentCardDemo extends StatelessWidget {
  final List<Appointment> appointments = [
    Appointment(
      clinicName: "MY CLINICS",
      address: "Moscow, st. Cosmonaut...",
      dateTime: DateTime.now().add(Duration(days: 2)),
      status: AppointmentStatus.upcoming,
      type: "PHARMACY",
      imageUrl: AppImageAsset.center2,
    ),
    Appointment(
      clinicName: "NATURE MEDICAL",
      address: "Moscow, st. 1st Communist...",
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      status: AppointmentStatus.completed,
            type: "PHARMACY",

      imageUrl: AppImageAsset.center2,
    ),
    Appointment(
      clinicName: "SAVE YOUR HEALTH",
      address: "Moscow, st. Lobachevsky, 20",
      dateTime: DateTime.now().add(Duration(hours: 3)),
      status: AppointmentStatus.cancelled,
            type: "PHARMACY",

      imageUrl: AppImageAsset.center2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments', style: TextStyle(fontWeight: FontWeight.w500)),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: AppointmentCard(appointment: appointments[index]),
          );
        },
      ),
    );
  }
}

