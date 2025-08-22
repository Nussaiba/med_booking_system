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
import 'package:med_booking_system/data/model/doctor/doctor_invitation_mode;.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_center_details.dart';
import 'package:med_booking_system/view/widgets/appointementcard.dart';
import 'package:med_booking_system/view/widgets/doctor/appointments_widgets/past_appointments_widgets.dart';
import 'package:med_booking_system/view/widgets/doctor/doctor_home/app_card.dart';
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
                        buildProfileHeader(controller.doctor),
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
                 controller.doctorInvitationsList.isNotEmpty?    CustomTitle(title: "Your Invitations"):Container(),
                   controller.doctorInvitationsList.isNotEmpty?  buildInvitationsSection(
                     
                      controller.doctorInvitationsList,
                        controller,
                    ):Container(),

                    CustomTitle(title: "Centers"),

                    buildSuggestedClinics(),
                    const SizedBox(height: 20),
                    CustomTitle(title: "Today's Schedule "),
                    buildUpcomingAppointments(controller2),
                    const SizedBox(height: 20),
                    buildA(),
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
      child:
      controller.dataDoctorCenters.isEmpty ? 
      buildEmptyState("No Centers Yet", null, Icons.local_hospital):
       ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.doctorCentersList.length,
        itemBuilder: (context, index) {
          return MedicalCenterCard(center: controller.doctorCentersList[index]);
        },
      ),
    );
  }

  Widget buildA() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.doctorAppointmentsList.length,
      itemBuilder: (context, index) {
        final appointment = controller.doctorAppointmentsList[index];
        // return
        // AppointmentDoctorCard(appointment:  appointment , onTap:(){ controller.goToAppointmentDetails(appointment.id);});    }
        return CustomAppointmentCard(
          appt: appointment,
          onTap: () {
            controller.goToAppointmentDetails(appointment.id);
          },
        );
      },
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

  Widget buildProfileHeader(DoctorProfileModel? doctor) {
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
                  "${doctor?.user.fullName}",
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
          ),
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

class MedicalCenterCard extends StatelessWidget {
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




Widget buildInvitationsSection(List<DoctorInvitationModel> invitations , DoctorHomeControllerImp controller) {
    return SizedBox(
    



      height: Get.height * 0.26,
      child: ListView.builder(
        
        scrollDirection: Axis.horizontal,
        itemCount: invitations.length,
        itemBuilder: (context, index) {
          final invitation = invitations[index];
          return DoctorInvitationCard(
            invitation: invitation,
            onAccept: () {
              controller.acceptInvitation(invitation.id.toString());
            },
            onReject: () {
              controller.rejectInvitation(invitation.id.toString());
            },
          );
        },
      ),
    );
  }






  Widget buildEmptyState(String title , String ?subtitle,IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.blue.shade300,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 12),
        subtitle != null ? Text(
         subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ):Container(),
          SizedBox(height: 24),
         
        ],
      ),
    );
  }
















class DoctorInvitationCard extends StatelessWidget {
  final DoctorInvitationModel invitation;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const DoctorInvitationCard({
    super.key,
    required this.invitation,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.medical_services_rounded,
                      color: Colors.blue[600], size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Medical Center Invitation",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
                _buildExpiryTime(),
              ],
            ),

            const SizedBox(height: 10),

            /// Message
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                invitation.message ??
                    "We are pleased to invite you to join our team.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey[800],
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// Details
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildDetailItem(
                  Icons.calendar_today,
                  "Sent: ${_formatDate(invitation.createdAt)}",
                ),
                if (invitation.expiresAt != null)
                  _buildDetailItem(
                    Icons.timer,
                    "Expires in: ${_getTimeDifference(invitation.expiresAt!)}",
                  ),
              ],
            ),

            // const SizedBox(height: 2),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onReject,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red[600],
                    side: BorderSide(color: Colors.red[200]!),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    textStyle: const TextStyle(fontSize: 11),
                  ),
                  child: const Text("Reject"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    textStyle: const TextStyle(fontSize: 11),
                    elevation: 1,
                  ),
                  child: const Text("Accept"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpiryTime() {
    if (invitation.expiresAt == null) return const SizedBox();
    final now = DateTime.now();
    final expiresAt = invitation.expiresAt!;
    if (expiresAt.isBefore(now)) {
      return _statusTag("Expired", Colors.red[600]!, Colors.red[50]!);
    }
    return _statusTag(
        "Valid • ${_getTimeDifference(expiresAt)}", Colors.green[700]!, Colors.green[50]!);
  }

  Widget _statusTag(String text, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 14, color: Colors.blue[600]),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyle(fontSize: 11, color: Colors.blueGrey[800], fontWeight: FontWeight.w500)),
      ]),
    );
  }

  String _formatDate(DateTime date) =>
      "${date.day}/${date.month}/${date.year}";

  String _getTimeDifference(DateTime expiryDate) {
    final diff = expiryDate.difference(DateTime.now());
    if (diff.inDays > 0) return "${diff.inDays} days";
    if (diff.inHours > 0) return "${diff.inHours} hrs";
    if (diff.inMinutes > 0) return "${diff.inMinutes} min";
    return "Less than 1 min";
  }
}
