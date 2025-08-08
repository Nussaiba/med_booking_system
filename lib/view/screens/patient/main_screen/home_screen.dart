import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/home_controller.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/appointement_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/build_specialties_section.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/doctor_card.dart';

import 'package:med_booking_system/view/widgets/patient/home_widgets/medical_center_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PatientHomeControllerImp controller = Get.put(
    PatientHomeControllerImp(),
  );
  final MainScreenController maincontroller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                _buildProfileHeader(),
                const SizedBox(height: 10),
                _buildSearchBar(),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: GetBuilder<PatientHomeControllerImp>(
          builder:
              (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTitle(title: "Specialties Section "),

                    buildSpecialtiesSection(controller.specialtiesList),
                    const SizedBox(height: 20),

                 
                    CustomTitle(title: "Centers"),

                    _buildSuggestedClinics(),
                    const SizedBox(height: 20),
                    CustomTitle(title: "Doctors "),

                    _buildDoctorsList(maincontroller.doctors),
                    const SizedBox(height: 20),
                  
                    CustomTitle(title: "Upcoming Appointments "),
                    _buildUpcomingAppointments(),
                    const SizedBox(height: 20),
                    CustomTitle(title: "Health Tips"),

                    _buildHealthTips(),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(
        //   color: Color(0xFFE0E0E0),
        //   width: 1,
        // ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 22, color: Color(0xFF9E9E9E)),
          SizedBox(width: 12),
          Text(
            'Search a doctor , center ',
            style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedClinics() {
    return SizedBox(
      height: Get.height * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.medicalCentersList.length,
        itemBuilder: (context, index) {
          return MedicalCenterCard(
            center: controller.medicalCentersList[index],
          );
        },
      ),
    );
  }

  Widget _buildDoctorsList(List<DoctorModel> doctors) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(doctor: doctors[index]);
      },
    );
  }

  Widget _buildUpcomingAppointments() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: maincontroller.upcomingAppointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(
          appointment: maincontroller.upcomingAppointments[index],
        );
      },
    );
  }

  Widget _buildHealthTips() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'كيف تحافظ على صحة أسنانك؟',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'اغسل أسنانك مرتين يومياً واستخدم الخيط الطبي...',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: const Text('اقرأ المزيد')),
              const Text(
                '15 يونيو',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18),

      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                image: AssetImage(AppImageAsset.doctor4),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, welcome back',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 2),
                Text(
                  'Sledge Hammer',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Icon(FontAwesomeIcons.bell, color: Colors.blue, size: 22),
            ),
          ), // onPressed: _editProfile,
        ],
      ),
    );
  }
}
