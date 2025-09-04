import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/home_controller.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/view/widgets/General/state_empty.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/build_specialties_section.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/center_by_specialty_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';
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
        preferredSize: Size.fromHeight(115),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                _buildProfileHeader(),
                // const SizedBox(height: 10),
                // _buildSearchBar(),
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

                    // CustomTitle(title: "Doctors "),

                    // buildDoctorsList(),
                    // const SizedBox(height: 20),
                    CustomTitle(title: "Upcoming Appointments "),
                
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

  Widget _buildSuggestedClinics() {
    return SizedBox(
      height: Get.height * 0.26,
      child:
          controller.selectedSpecialtyId == 0 &&
                  controller.medicalCentersList.isEmpty
              ? buildEmptyState("No Centers Yet", null, Icons.local_hospital)
              : controller.selectedSpecialtyId != 0 &&
                  controller.centersAndDoctorsBySpecialtyList.isEmpty
              ? buildEmptyState(
                "No Centers Yet",
                "No Centers with the specialty ${controller.specialtiesList[controller.selectedSpecialtyId].name} ",
                Icons.local_hospital,
              )
              : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    controller.selectedSpecialtyId == 0
                        ? controller.medicalCentersList.length
                        : controller.centersAndDoctorsBySpecialtyList.length,
                itemBuilder: (context, index) {
                  return controller.selectedSpecialtyId == 0
                      ? MedicalCenterCard(
                        center: controller.medicalCentersList[index],
                      )
                      : MedicalCenterBySpecialtyCard(
                        center:
                            controller.centersAndDoctorsBySpecialtyList[index],
                      );
                },
              ),
    );
  }

  // Widget _buildDoctorsList(List<DoctorModel> doctors) {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: doctors.length,
  //     itemBuilder: (context, index) {
  //       return DoctorCard(doctor: doctors[index]);
  //     },
  //   );
  // }

  


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
