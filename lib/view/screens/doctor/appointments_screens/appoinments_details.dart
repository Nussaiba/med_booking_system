import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/appointments_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorAppointmentDetailController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment Details"),
        centerTitle: true,
      ),
      body: GetBuilder<DoctorAppointmentDetailController>(
        builder: (controller) {
          final appointment = controller.appointmentModel;
          final user = appointment?.user;

          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 16),
                  PatientHeader(
                    
                    name: "${user?.fullName}",
                              imageUrl: user?.profilePhoto,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // ===== Appointment Info =====
                        buildInfoSection(
                          title: 'Appointment Information',
                          icon: Icons.event_note,
                          children: [
                            buildInfoItem(
                              Icons.calendar_today,
                              'Date',
                              appointment?.appointmentDate.toString() ??
                                  "Not specified",
                            ),
                            buildInfoItem(
                              Icons.access_time,
                              'Time',
                              appointment?.appointmentTime ?? "Not specified",
                            ),
                            buildInfoItem(
                              Icons.verified,
                              'Status',
                              appointment?.status ?? "Not specified",
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ===== Contact Info =====
                        buildInfoSection(
                          title: 'Contact Information',
                          icon: Icons.contact_phone,
                          children: [
                            buildInfoItem(
                              Icons.phone,
                              'Phone',
                              user?.phone ?? "Not specified",
                            ),
                            buildInfoItem(
                              Icons.email,
                              'Email',
                              user?.email ?? "Not specified",
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ===== Notes =====
                        buildInfoSection(
                          title: 'Notes',
                          icon: Icons.note_alt_outlined,
                          children: [
                            buildInfoItem(
                              Icons.description,
                              'Notes',
                              appointment?.notes ?? "No notes",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class AppointmentHeader extends StatelessWidget {
//   final String patientName;
//   final String? patientImage;

//   const AppointmentHeader({
//     super.key,
//     required this.patientName,
//     required this.patientImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
//         ],
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
//       ),
//       child: Row(
//         children: [
//           patientImage != null
//               ? CircleAvatar(
//                 radius: 32,
//                 backgroundImage: NetworkImage(patientImage!),
//               )
//               : Icon(Icons.person),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               patientName,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



class PatientHeader extends StatelessWidget {
  final String name;
  final String? imageUrl;

  const PatientHeader({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(
            Icons.health_and_safety_rounded,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }
}
