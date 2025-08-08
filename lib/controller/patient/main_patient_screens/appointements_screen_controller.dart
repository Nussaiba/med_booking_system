import 'package:get/get.dart';
import 'package:med_booking_system/data/model/appointment.dart';

class AppointmentController extends GetxController {
  var upcomingAppointments = <Appointment>[].obs;
  var pastAppointments = <Appointment>[].obs;

  @override
  void onInit() {
    _loadAppointments();
    super.onInit();
  }

  void _loadAppointments() {
    // بيانات مثاليه (استبدل ببيانات حقيقية من API)
    upcomingAppointments.assignAll([
      Appointment(
        id: '1',
        doctorName: 'د. أحمد محمد',
        specialty: 'أخصائي قلب',
        clinicName: 'مركز الشفاء الطبي',
        dateTime: DateTime.now().add(const Duration(days: 2)),
        status: 'upcoming',
        imageUrl: 'https://example.com/doctor1.jpg',
      ),
      // ... مواعيد أخرى قادمة
    ]);

    pastAppointments.assignAll([
      Appointment(
        id: '2',
        doctorName: 'د. سارة علي',
        specialty: 'أخصائية أسنان',
        clinicName: 'عيادة الابتسامة',
        dateTime: DateTime.now().subtract(const Duration(days: 5)),
        status: 'completed',
        imageUrl: 'https://example.com/doctor2.jpg',
      ),
      // ... مواعيد سابقة أخرى
    ]);
  }
}