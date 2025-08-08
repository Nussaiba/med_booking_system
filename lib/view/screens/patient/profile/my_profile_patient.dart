import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/appointement_card.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class PatientProfileScreen extends StatefulWidget {
  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  final PatientProfile _patient = PatientProfile(
    name: 'John Smith',
    email: 'john.smith@example.com',
    phone: '+966501234567',
    birthDate: DateTime(1990, 5, 15),
    bloodType: 'O+',
    gender: 'Male',
    imageUrl: AppImageAsset.doctor4,
    address: '123 Medical St, Riyadh',
    insurance: 'AXA Insurance (VIP)',
  );

  int _selectedTab = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 2),
        child: Column(
          children: [
              ProfileHeader(
                    name: "${_patient.name}",
                    birthDate: DateTime(1977, 2, 12),
                    // imageUrl: user?.profilePhoto,
                    imageUrl: null,
                    isNetworkImage: true,
                    onEdit: () {
                      // Get.to(CreateDoctorProfileScreen());
                    },
                    bloodType: _patient.bloodType,
                  ),
            // _buildProfileHeader(),
            _buildTabBar(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                children: [
                  _buildPersonalInfo(),
                  _buildAppointments(),
                  _buildMedicalRecords(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                image: AssetImage(_patient.imageUrl),
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
                  _patient.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  'Age: ${DateTime.now().year - _patient.birthDate.year}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.bloodtype, size: 14, color: Colors.red),
                    SizedBox(width: 4),
                    Text(
                      _patient.bloodType,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, size: 30, color: Colors.blue),
            onPressed: _editProfile,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _buildTabButton('Personal', 0),
          _buildTabButton('Appointments', 1),
          _buildTabButton('Records', 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color:
                _selectedTab == index
                    ? Colors.blue.shade600
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _selectedTab == index ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _buildInfoSection(
            title: 'Contact Information',
            icon: Icons.contact_mail,
            children: [
              _buildInfoItem(Icons.email, 'Email', _patient.email),
              _buildInfoItem(Icons.phone, 'Phone', _patient.phone),
              _buildInfoItem(Icons.location_on, 'Address', _patient.address),
            ],
          ),
          SizedBox(height: 16),
          _buildInfoSection(
            title: 'Personal Details',
            icon: Icons.person_outline,
            children: [
              _buildInfoItem(Icons.person, 'Gender', _patient.gender),
              _buildInfoItem(
                Icons.cake,
                'Date of Birth',
                DateFormat('MMMM d, y').format(_patient.birthDate),
              ),
              _buildInfoItem(Icons.bloodtype, 'Blood Type', _patient.bloodType),
              _buildInfoItem(
                Icons.medical_services,
                'Insurance',
                _patient.insurance,
              ),
            ],
          ),
          SizedBox(height: 6),
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

  
  
  Widget _buildAppointments() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
                    CustomTitle(title: "Upcoming Appointments"),

        
        SizedBox(height: 16),
        AppointmentCard(appointment:   Appointment(
      clinicName: "MY CLINICS",
      address: "Moscow, st. Cosmonaut...",
      dateTime: DateTime.now().add(Duration(days: 2)),
      status: AppointmentStatus.upcoming,
      type: "PHARMACY",
      imageUrl: AppImageAsset.center2,
    ),),
      
        SizedBox(height: 24),
                            CustomTitle(title: "Past Appointments"),

    
        SizedBox(height: 16),
               AppointmentCard(appointment:     Appointment(
      clinicName: "NATURE MEDICAL",
      address: "Moscow, st. 1st Communist...",
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      status: AppointmentStatus.completed,
            type: "PHARMACY",

      imageUrl: AppImageAsset.center2,
    ),),

      ],
    );
  }

  Widget _buildMedicalRecords() {
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

  void _editProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Add your edit form fields here
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Save Changes'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
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
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold
        
    ,fontSize: 14
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(' $doctor', style: TextStyle(fontSize: 12) ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(date, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
Spacer(),                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(type, style: TextStyle(fontSize: 12, )),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          // Navigate to record details
        },
      ),
    );
  }
}
