import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/show_patient_profle_controller.dart';
import 'package:med_booking_system/data/model/patient/appointment_model.dart';
import 'package:med_booking_system/data/model/patient/paient_model.dart';
import 'package:med_booking_system/view/widgets/appointementcard.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';

Widget buildTabBar(ShowPatientProfleController controller) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        _buildTabButton('Personal', 0, controller),
        _buildTabButton('Appointments', 1, controller),
        _buildTabButton('Records', 2, controller),
      ],
    ),
  );
}

Widget _buildTabButton(
  String text,
  int index,
  ShowPatientProfleController controller,
) {
  return Expanded(
    child: InkWell(
      onTap: () => controller.changeTab(index),
      child: Obx(() {
        bool isSelected = controller.selectedTab.value == index;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade600 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        );
      }),
    ),
  );
}

// Widget buildPersonalInfo(PatientProfileModel p) {
//   return SingleChildScrollView(
//     padding: EdgeInsets.all(10),
//     child: Column(
//       children: [
//         _buildInfoSection(
//           title: 'Contact Information',
//           icon: Icons.contact_mail,
//           children: [
//             _buildInfoItem(Icons.email, 'Email', p.personal.contactInfo.email),
//             _buildInfoItem(Icons.phone, 'Phone', p.personal.contactInfo.phone),
//             _buildInfoItem(Icons.location_on, 'Address', p.personal.contactInfo.address ?? 'Not '),
//           ],
//         ),
//         SizedBox(height: 16),
//         _buildInfoSection(
//           title: 'Personal Details',
//           icon: Icons.person_outline,
//           children: [
//             _buildInfoItem(Icons.person, 'Gender', p.personal.personalDetails.gender ?? 'Not'),
//             _buildInfoItem(
//               Icons.cake,
//               'Date of Birth',
//               p.personal.personalDetails.birthdate?? 'Not'
//               // DateFormat('MMMM d, y').format(p.personal.personalDetails.birthdate),
//             ),
//    _buildInfoItem(
//               Icons.cake,
//               'Age',
//             p.personal.personalDetails.age.toString(),
//             ),
//             // _buildInfoItem(Icons.bloodtype, 'Blood Type', p.bloodType),
//             // _buildInfoItem(Icons.medical_services, 'Insurance', p.insurance),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildInfoSection({
//   required String title,
//   required IconData icon,
//   required List<Widget> children,
// }) {
//   return Card(
//     elevation: 0,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     child: Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: Colors.blue, size: 18),
//               SizedBox(width: 8),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[800],
//                 ),
//               ),
//             ],
//           ),
//           Divider(color: Colors.grey[300], height: 24),
//           Column(children: children),
//         ],
//       ),
//     ),
//   );
// }

// Widget _buildInfoItem(IconData icon, String label, String value) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 8),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 16, color: Colors.blue[400]),
//         SizedBox(width: 12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 value,
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// ================= Personal Info =================
Widget buildPersonalInfo(PatientProfileModel p) {
  return Column(
    children: [
      _buildInfoSection(
        title: 'Contact Information',
        icon: Icons.contact_mail,
        children: [
          _buildInfoItem(Icons.email, 'Email', p.personal?.contactInfo.email ?? 'Not Available'),
          _buildInfoItem(Icons.phone, 'Phone', p.personal?.contactInfo.phone ?? 'Not Available'),
          _buildInfoItem(Icons.location_on, 'Address', p.personal?.contactInfo.address ?? 'Not Available'),
        ],
      ),
      SizedBox(height: 16),
      _buildInfoSection(
        title: 'Personal Details',
        icon: Icons.person_outline,
        children: [
          _buildInfoItem(Icons.person, 'Gender', p.personal?.personalDetails.gender ?? 'Not Available'),
          _buildInfoItem(Icons.cake, 'Date of Birth', p.personal?.personalDetails.birthdate ?? 'Not Available'),
          _buildInfoItem(Icons.access_time, 'Age', p.personal?.personalDetails.age?.toString() ?? 'Not Available'),
        ],
      ),
    ],
  );
}

// ================= Medical Info =================
Widget buildMedicalInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Medical Information',
    icon: Icons.local_hospital,
    children: [
      _buildInfoItem(Icons.healing, 'Condition', p.medical?.condition ?? 'Not Available'),
      _buildInfoItem(Icons.history, 'Medical History', p.medical?.medicalHistory ?? 'Not Available'),
      _buildInfoItem(Icons.warning, 'Allergies', p.medical?.allergies ?? 'Not Available'),
      _buildInfoItem(Icons.medical_services, 'Current Medications', p.medical?.currentMedications ?? 'Not Available'),
      _buildInfoItem(Icons.family_restroom, 'Family History', p.medical?.familyMedicalHistory ?? 'Not Available'),
      _buildInfoItem(Icons.bloodtype, 'Blood Type', p.medical?.bloodType ?? 'Not Available'),
      _buildInfoItem(Icons.height, 'Height', p.medical?.height ?? 'Not Available'),
      _buildInfoItem(Icons.monitor_weight, 'Weight', p.medical?.weight ?? 'Not Available'),
      _buildInfoItem(Icons.calculate, 'BMI', p.medical?.bmi?.toStringAsFixed(1) ?? 'Not Available'),
      _buildInfoItem(Icons.category, 'BMI Category', p.medical?.bmiCategory ?? 'Not Available'),
    ],
  );
}

// ================= Emergency Contact =================
Widget buildEmergencyInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Emergency Contact',
    icon: Icons.warning_amber,
    children: [
      _buildInfoItem(Icons.person, 'Name', p.emergencyContacts?.name ?? 'Not Available'),
      _buildInfoItem(Icons.phone, 'Phone', p.emergencyContacts?.phone ?? 'Not Available'),
    ],
  );
}

// ================= Lifestyle =================
Widget buildLifestyleInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Lifestyle',
    icon: Icons.fitness_center,
    children: [
      _buildInfoItem(Icons.smoking_rooms, 'Smoking', p.lifestyle?.smokingStatus ?? 'Not Available'),
      _buildInfoItem(Icons.local_bar, 'Alcohol', p.lifestyle?.alcoholConsumption ?? 'Not Available'),
      _buildInfoItem(Icons.sports_gymnastics, 'Notes', p.lifestyle?.lifestyleNotes ?? 'Not Available'),
    ],
  );
}

// ================= Follow Up =================
Widget buildFollowUpInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Follow Up',
    icon: Icons.schedule,
    children: [
      _buildInfoItem(Icons.calendar_today, 'Last Visit', p.followUp?.lastVisit ?? 'Not Available'),
      _buildInfoItem(Icons.calendar_month, 'Next Follow-Up', p.followUp?.nextFollowUp ?? 'Not Available'),
      _buildInfoItem(Icons.notes, 'Treatment Notes', p.followUp?.treatmentNotes ?? 'Not Available'),
    ],
  );
}

// ================= Insurance =================
Widget buildInsuranceInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Insurance',
    icon: Icons.verified_user,
    children: [
      _buildInfoItem(Icons.business, 'Provider', p.insurance?.provider ?? 'Not Available'),
      _buildInfoItem(Icons.confirmation_number, 'Number', p.insurance?.number ?? 'Not Available'),
      _buildInfoItem(Icons.date_range, 'Expiry', p.insurance?.expiry ?? 'Not Available'),
      _buildInfoItem(Icons.warning, 'Is Expired', p.insurance?.isExpired == true ? 'Yes' : 'No'),
    ],
  );
}

// ================= Appointments =================
Widget buildAppointmentsInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Appointments',
    icon: Icons.event,
    children: [
      // _buildInfoItem(Icons.upcoming, 'Upcoming', p.appointments?.upcoming.isEmpty ? 'None' : '${p.appointments.upcoming.length} Appointments'),
      // _buildInfoItem(Icons.history, 'Old', p.appointments.old.isEmpty ? 'None' : '${p.appointments.old.length} Appointments'),
    ],
  );
}

// ================= Medical Reports =================
Widget buildReportsInfo(PatientProfileModel p) {
  return _buildInfoSection(
    title: 'Medical Reports',
    icon: Icons.description,
    children: [
      // _buildInfoItem(Icons.file_copy, 'Reports', p.medicalReports?.isEmpty ? 'No Reports' : '${p.medicalReports.length} Reports'),
    ],
  );
}

// ================= Shared UI =================
Widget _buildInfoSection({
  required String title,
  required IconData icon,
  required List<Widget> children,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue, size: 18),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[300], height: 24),
          Column(children: children),
        ],
      ),
    ),
  );
}

Widget _buildInfoItem(IconData icon, String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.blue[400]),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildAppointments(List <AppointmentModel> upcomingAppointements,List <AppointmentModel> pastAppointements, ) {
  return ListView(
    padding: EdgeInsets.all(16),
    children: [
      CustomTitle(title: "Upcoming Appointments"),
      SizedBox(height: 16),
       ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: upcomingAppointements.length,
        itemBuilder: (context, index) {
          return AppointmentCard2(appointment:  upcomingAppointements[index],);
        },
      ),
  
      SizedBox(height: 24),
      CustomTitle(title: "Past Appointments"),
      SizedBox(height: 16),
    ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: pastAppointements.length,
        itemBuilder: (context, index) {
          return AppointmentCard2(appointment:  pastAppointements[index],);
        },
      ),
  
    ]
  );
}

// Widget buildMedicalRecords() {
//   return ListView(
//     padding: EdgeInsets.all(16),
//     children: [
//       CustomTitle(title: "Medical History"),
//       SizedBox(height: 16),
//       MedicalRecordCard(
//         title: 'Blood Test Results',
//         date: 'Nov 10, 2023',
//         doctor: 'Dr. Ahmed Mohamed',
//         type: 'Lab Report',
//       ),
//       MedicalRecordCard(
//         title: 'X-Ray Report',
//         date: 'Oct 5, 2023',
//         doctor: 'Dr. Sara Abdullah',
//         type: 'Radiology',
//       ),
//       MedicalRecordCard(
//         title: 'Prescription',
//         date: 'Sep 22, 2023',
//         doctor: 'Dr. Khalid Hassan',
//         type: 'Medication',
//       ),
//     ],
//   );
// }

// class PatientProfile {
//   final String name;
//   final String email;
//   final String phone;
//   final DateTime birthDate;
//   final String bloodType;
//   final String gender;
//   final String imageUrl;
//   final String address;
//   final String insurance;

//   PatientProfile({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.birthDate,
//     required this.bloodType,
//     required this.gender,
//     required this.imageUrl,
//     required this.address,
//     required this.insurance,
//   });
// }

// class MedicalRecordCard extends StatelessWidget {
//   final String title;
//   final String date;
//   final String doctor;
//   final String type;

//   const MedicalRecordCard({
//     required this.title,
//     required this.date,
//     required this.doctor,
//     required this.type,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 12),
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(color: Colors.grey[200]!, width: 1),
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16),
//         leading: Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             color: Colors.blue[50],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(Icons.medical_services, color: Colors.blue),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 4),
//             Text(' $doctor', style: TextStyle(fontSize: 12)),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Icon(Icons.calendar_today, size: 14, color: Colors.grey),
//                 SizedBox(width: 4),
//                 Text(
//                   date,
//                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                 ),
//                 Spacer(),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(type, style: TextStyle(fontSize: 12)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: Icon(Icons.chevron_right, color: Colors.grey),
//         onTap: () {},
//       ),
//     );
//   }
// }
