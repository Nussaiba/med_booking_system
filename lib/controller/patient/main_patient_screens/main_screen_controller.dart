import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/data_sources/static/doctor_center.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:med_booking_system/data/model/s.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/doctor_home_screen.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/appointement_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/doctor_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/medical_center_card.dart';

class MainScreenController extends GetxController {
  final List<AppointmentModel> todayAppointments = [
    AppointmentModel(
      patientName: "John Doe",
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 9, minute: 30),
      status: "Scheduled",
    ),
    AppointmentModel(
      patientName: "Sarah Smith",
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 10, minute: 30),
      status: "Completed",
    ),
    AppointmentModel(
      patientName: "Ali Hasan",
      startTime: TimeOfDay(hour: 11, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 30),
      status: "Cancelled",
    ),
  ];

  final List<Specialty> specialties = [
    Specialty(icon: FontAwesomeIcons.heart, name: 'Cardiology', id: '1'),
    Specialty(icon: FontAwesomeIcons.tooth, name: 'Dentistry', id: '2'),
    Specialty(icon: FontAwesomeIcons.eye, name: 'Ophthalmology', id: '3'),
    Specialty(icon: FontAwesomeIcons.brain, name: 'Neurology', id: '4'),
    Specialty(icon: FontAwesomeIcons.baby, name: 'Pediatrics', id: '5'),
  ];
  final List<Appointment> upcomingAppointments = [
    Appointment(
      clinicName: "MY CLINICS",
      address: "Moscow, st. Cosmonaut...",
      dateTime: DateTime.now().add(Duration(days: 2)),
      status: AppointmentStatus.upcoming,
      type: "PHARMACY",
      imageUrl: AppImageAsset.center2,
    ),
    Appointment(
      clinicName: "MY CLINICS",
      address: "Moscow, st. Cosmonaut...",
      dateTime: DateTime.now().add(Duration(days: 2)),
      status: AppointmentStatus.upcoming,
      type: "PHARMACY",
      imageUrl: AppImageAsset.center2,
    ),
  ];

  List<DoctorModel> doctors = [];

  List<CenterModel> medicalCenters = [];

  var selectedIndex = 0.obs;
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();

  var page = RxInt(0);
  void onItemClick(index) {
    if (index != page.value) {
      page(index);
      selectedIndex.value = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    pageController = PageController();
    medicalCenters = centersList;
    doctors = doctorsList;
  }
}
