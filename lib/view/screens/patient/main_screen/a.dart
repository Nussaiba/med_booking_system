import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  final RxInt activeTab = 0.obs; // 0 للأطباء، 1 للمراكز
  final List<Doctor> doctors = []; // قائمة الأطباء
  final List<MedicalCenter> centers = []; 
  
  // قائمة المراكز
  List<Doctor> doctorsList = [
  Doctor(
    image: "https://example.com/doctors/dr_khaled.jpg",
    name: "د. خالد أحمد",
    specialty: "جراحة العظام",
    rating: 4.7,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_sara.jpg",
    name: "د. سارة محمد",
    specialty: "طب الأطفال",
    rating: 4.9,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_ali.jpg",
    name: "د. علي محمود",
    specialty: "القلب والأوعية",
    rating: 4.8,
  ),
];


List<MedicalCenter> centersList = [
  MedicalCenter(
    image: "https://example.com/centers/royal_hospital.jpg",
    name: "المستشفى الملكي",
    location: "شارع الجامعة، الرياض",
    doctors:[
      Doctor(
    image: "https://example.com/doctors/dr_khaled.jpg",
    name: "د. خالد أحمد",
    specialty: "جراحة العظام",
    rating: 4.7,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_sara.jpg",
    name: "د. سارة محمد",
    specialty: "طب الأطفال",
    rating: 4.9,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_ali.jpg",
    name: "د. علي محمود",
    specialty: "القلب والأوعية",
    rating: 4.8,
  ),
    ]
  ),
  MedicalCenter(
    image: "https://example.com/centers/alnoor_center.jpg",
    name: "مركز النور التخصصي",
    location: "حي الصفا، جدة",
    doctors: [Doctor(
    image: "https://example.com/doctors/dr_khaled.jpg",
    name: "د. خالد أحمد",
    specialty: "جراحة العظام",
    rating: 4.7,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_sara.jpg",
    name: "د. سارة محمد",
    specialty: "طب الأطفال",
    rating: 4.9,
  ),
  Doctor(
    image: "https://example.com/doctors/dr_ali.jpg",
    name: "د. علي محمود",
    specialty: "القلب والأوعية",
    rating: 4.8,
  ),
    ],
  ),
];

}


class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DOCITIVE"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // شريط التبديل
          _buildToggleBar(),
          // عرض المحتوى
          Expanded(child: Obx(() => _controller.activeTab.value == 0 
              ? _buildDoctorsList() 
              : _buildCentersList()
          )),
        ],
      ),
    );
  }

  Widget _buildToggleBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _controller.activeTab.value == 0 
                    ? Colors.blue.shade700 
                    : Colors.grey.shade300,
              ),
              onPressed: () => _controller.activeTab.value = 0,
              child: Text("الأطباء"),
            )),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _controller.activeTab.value == 1 
                    ? Colors.blue.shade700 
                    : Colors.grey.shade300,
              ),
              onPressed: () => _controller.activeTab.value = 1,
              child: Text("المراكز"),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsList() {
    return ListView.builder(
      itemCount: _controller.doctorsList.length,
      itemBuilder: (ctx, index) => DoctorCard(
        doctor: _controller.doctorsList[index],
     //   onBook: () => Get.to(BookingScreen()),
      ),
    );
  }

  Widget _buildCentersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemCount: _controller.centersList.length,
      itemBuilder: (ctx, index) => CenterCard(
        center: _controller.centersList[index],
      ),
    );
  }
}
class DoctorCard extends StatelessWidget {
   final Doctor doctor;

   DoctorCard({super.key, required this.doctor});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(doctor.image)),
            title: Text(doctor.name),
            subtitle: Text(doctor.specialty),
            trailing: IconButton(
              icon: Icon(Icons.video_call, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Text("${doctor.rating}"),
                Spacer(),
                FilledButton(
                  onPressed: () {},
                  child: Text("حجز"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CenterCard extends StatelessWidget {
   final MedicalCenter center;

  const CenterCard({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
      //  onTap: () => Get.to(CenterDetailsScreen()),
        child: Column(
          children: [
            Expanded(
              child: Image.network(center.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(center.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("${center.doctors.length} أطباء متاحون"),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14),
                      Text(center.location),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String image;
  final String name;
  final String specialty;
  final double rating;

  Doctor({
    required this.image,
    required this.name,
    required this.specialty,
    required this.rating,
  });
}



class MedicalCenter {
  final String image;
  final String name;
  final String location;
  final List<Doctor> doctors;

  MedicalCenter({
    required this.image,
    required this.name,
    required this.location,
    required this.doctors,
  });
}


