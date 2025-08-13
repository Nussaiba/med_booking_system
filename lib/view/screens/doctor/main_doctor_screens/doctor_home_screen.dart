// import 'package:flutter/material.dart';
// import 'package:med_booking_system/data/model/all_model.dart';

// class HomeDoctorScreen extends StatelessWidget {
//   final DoctorModel doctor = DoctorModel(
//     id: "doc1",
//     fullName: "Dr. Leen Ziad",
//     specialty: "Dentist",
//     profileImage: "https://images.pexels.com/photos/40568/doctor-medical-medicine-health-40568.jpeg",
//     about: "Experienced dentist with 10+ years of service.",
//     totalPatients: 1200,
//     yearsExperience: 12,
//     rating: 4.8,
//     reviewCount: 87,
//     appointmentDuration: 30,
//     reviews: [
//       ReviewModel(
//         reviewerName: "Ali",
//         reviewerImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
//         stars: 5,
//         comment: "Very professional!",
//       ),
//     ],
//     centers: [
//       CenterModel(
//         id: "c1",
//         name: "Smile Dental Center",
//         address: "123 Main St",
//         location: "Damascus",
//         imageUrl: "https://images.pexels.com/photos/263402/pexels-photo-263402.jpeg",
//         rating: 4.6,
//         specialties: ["Dentistry"],
//         isFeatured: true,
//         workingDays: ["Monday", "Tuesday", "Wednesday"],
//         workingStart: TimeOfDay(hour: 9, minute: 0),
//         workingEnd: TimeOfDay(hour: 17, minute: 0),
//       )
//     ],
//   );

//   String formatTimeOfDay(TimeOfDay t) {
//     final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
//     final minute = t.minute.toString().padLeft(2, '0');
//     final period = t.period == DayPeriod.am ? 'AM' : 'PM';
//     return "$hour:$minute $period";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 150,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundImage: NetworkImage(doctor.profileImage),
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Dr. ${doctor.fullName}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                     Text(doctor.specialty, style: TextStyle(color: Colors.grey[600])),
//                   ],
//                 ),
//                 const Spacer(),
//                 const Icon(Icons.notifications_none, color: Colors.blue)
//               ],
//             ),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.waving_hand_outlined, size: 22, color: Colors.orange),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Text('Have a good day with your patients', style: TextStyle(fontSize: 14)),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Text("My Centers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           ...doctor.centers.map((center) => Card(
//                 margin: const EdgeInsets.only(bottom: 16),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(center.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 6),
//                       Text(center.address),
//                       const SizedBox(height: 6),
//                       Text("${center.workingDays.join(', ')} | ${formatTimeOfDay(center.workingStart)} - ${formatTimeOfDay(center.workingEnd)}"),
//                       const SizedBox(height: 8),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(center.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//           const SizedBox(height: 16),
//           Text("Patient Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           ...doctor.reviews.map((r) => ListTile(
//                 leading: CircleAvatar(backgroundImage: NetworkImage(r.reviewerImage)),
//                 title: Text(r.reviewerName),
//                 subtitle: Text(r.comment),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: List.generate(5, (i) => Icon(Icons.star,
//                       size: 16,
//                       color: i < r.stars ? Colors.amber : Colors.grey[300])),
//                 ),
//               )),
//           const SizedBox(height: 16),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.lightBlue.shade50,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Text(
//               'Don’t forget to fill in the medical records after each appointment!',
//               style: TextStyle(fontSize: 13, color: Colors.black87),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/home_doctor_controller.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_center_details.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/appointement_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/build_specialties_section.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/doctor_card.dart';

import 'package:med_booking_system/view/widgets/patient/home_widgets/medical_center_card.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});

  final MainScreenController controller2 = Get.put(MainScreenController());
  final DoctorHomeControllerImp controller = Get.put(DoctorHomeControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeControllerImp>(
      builder:
          (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Scaffold(
              // backgroundColor: Colors.grey[50],
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(125),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: Column(
                      children: [
                        _buildProfileHeader(),
                        const SizedBox(height: 10),
                        // _buildSearchBar(),
                      ],
                    ),
                  ),
                ),
              ),

              body: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: ListView(
                  children: [
                    GreetingBar(),
                    const SizedBox(height: 20),

                    CustomTitle(title: "Centers"),

                    buildSuggestedClinics(),
                    const SizedBox(height: 20),
                    CustomTitle(title: "Today's Schedule "),
                    buildUpcomingAppointments(controller2),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget buildSuggestedClinics() {
    return SizedBox(
      height: Get.height * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dataDoctorCenters.length,
        itemBuilder: (context, index) {
          return MedicalCenterCard(center: controller.doctorCentersList[index]);
        },
      ),
    );
  }

  Widget buildUpcomingAppointments(MainScreenController controller2) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller2.upcomingAppointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(
          appointment: controller2.upcomingAppointments[index],
        );
      },
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

class GreetingBar extends StatelessWidget {
  const GreetingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.waving_hand_outlined, size: 22, color: Colors.orange),
          SizedBox(width: 12),
          Text(
            'Have a good day with your patients',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class AppointmentModel {
  final String patientName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String status; // Scheduled / Cancelled / Completed

  AppointmentModel({
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
}

class MedicalCenterCard extends StatelessWidget {
  // final CenterModel center;
  final DoctorCenterModel center;
  const MedicalCenterCard({required this.center});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CenterDetailsScreen(), arguments: {'center': center});
      },
      child: SizedBox(
        width: Get.width * .88,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      // center.imageUrl,
                      AppImageAsset.center4,
                      width: Get.width * .84,

                      height: Get.height * 0.18,

                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.bookmark_border, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    center.centerName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          '4.5',
                          // center.rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Damascus',
                    // center.centerAddress!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
