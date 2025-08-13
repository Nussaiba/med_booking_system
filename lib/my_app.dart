import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/binding/initialbindinds.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:med_booking_system/routs.dart';
import 'package:med_booking_system/view/screens/auth/choose_account_type.dart';
import 'package:med_booking_system/view/screens/doctor/auth/doctor_register.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/main_doctor_screens.dart';
import 'package:med_booking_system/view/screens/doctor/profile/create_doctor_profile.dart';
import 'package:med_booking_system/view/screens/patient/booking/booking_from_center.dart';
import 'package:med_booking_system/view/screens/patient/booking/booking_screen.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/main_patient_screens.dart';
import 'package:med_booking_system/view/screens/patient/profile/create_patient_profile.dart';
import 'package:med_booking_system/view/screens/patient/profile/my_profile_patient.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_doctor_details_by_other.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          // backgroundColor:  Colors.white
        ),
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      // home: MainPatientScreens(),
      // home:  MainDoctorScreens(),
      home: ChooseAccountType(),
      // home: PatientProfileScreen(),
      getPages: routes,
      initialBinding: InitialBindings(),

      // initialRoute: '/mainpaientscreen',
    );
  }
}
