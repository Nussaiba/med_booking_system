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

Widget buildPersonalInfo(PatientProfileModel p) {
  return SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        _buildInfoSection(
          title: 'Contact Information',
          icon: Icons.contact_mail,
          children: [
            _buildInfoItem(Icons.email, 'Email', p.personal.contactInfo.email),
            _buildInfoItem(Icons.phone, 'Phone', p.personal.contactInfo.phone),
            _buildInfoItem(Icons.location_on, 'Address', p.personal.contactInfo.address ?? 'Not '),
          ],
        ),
        SizedBox(height: 16),
        _buildInfoSection(
          title: 'Personal Details',
          icon: Icons.person_outline,
          children: [
            _buildInfoItem(Icons.person, 'Gender', p.personal.personalDetails.gender),
            _buildInfoItem(
              Icons.cake,
              'Date of Birth',
              DateFormat('MMMM d, y').format(p.personal.personalDetails.birthdate),
            ),
   _buildInfoItem(
              Icons.cake,
              'Age',
            p.personal.personalDetails.age.toString(),
            ),
            // _buildInfoItem(Icons.bloodtype, 'Blood Type', p.bloodType),
            // _buildInfoItem(Icons.medical_services, 'Insurance', p.insurance),
          ],
        ),
      ],
    ),
  );
}

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

Widget buildMedicalRecords() {
  return ListView(
    padding: EdgeInsets.all(16),
    children: [
      CustomTitle(title: "Medical History"),
      SizedBox(height: 16),
      MedicalRecordCard(
        title: 'Blood Test Results',
        date: 'Nov 10, 2023',
        doctor: 'Dr. Ahmed Mohamed',
        type: 'Lab Report',
      ),
      MedicalRecordCard(
        title: 'X-Ray Report',
        date: 'Oct 5, 2023',
        doctor: 'Dr. Sara Abdullah',
        type: 'Radiology',
      ),
      MedicalRecordCard(
        title: 'Prescription',
        date: 'Sep 22, 2023',
        doctor: 'Dr. Khalid Hassan',
        type: 'Medication',
      ),
    ],
  );
}

class PatientProfile {
  final String name;
  final String email;
  final String phone;
  final DateTime birthDate;
  final String bloodType;
  final String gender;
  final String imageUrl;
  final String address;
  final String insurance;

  PatientProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.bloodType,
    required this.gender,
    required this.imageUrl,
    required this.address,
    required this.insurance,
  });
}

class MedicalRecordCard extends StatelessWidget {
  final String title;
  final String date;
  final String doctor;
  final String type;

  const MedicalRecordCard({
    required this.title,
    required this.date,
    required this.doctor,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.medical_services, color: Colors.blue),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(' $doctor', style: TextStyle(fontSize: 12)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(type, style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
