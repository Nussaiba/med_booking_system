// import 'package:get/get.dart';
// import 'package:med_booking_system/data/model/appointment.dart';

// class AppointmentController extends GetxController {
//   var upcomingAppointments = <Appointment>[].obs;
//   var pastAppointments = <Appointment>[].obs;

//   @override
//   void onInit() {
//     _loadAppointments();
//     super.onInit();
//   }

//   void _loadAppointments() {

//     upcomingAppointments.assignAll([
//       Appointment(
//         id: '1',
//         doctorName: 'د. أحمد محمد',
//         specialty: 'أخصائي قلب',
//         clinicName: 'مركز الشفاء الطبي',
//         dateTime: DateTime.now().add(const Duration(days: 2)),
//         status: 'upcoming',
//         imageUrl: 'https://example.com/doctor1.jpg',
//       ),
//       // ... مواعيد أخرى قادمة
//     ]);

//     pastAppointments.assignAll([
//       Appointment(
//         id: '2',
//         doctorName: 'د. سارة علي',
//         specialty: 'أخصائية أسنان',
//         clinicName: 'عيادة الابتسامة',
//         dateTime: DateTime.now().subtract(const Duration(days: 5)),
//         status: 'completed',
//         imageUrl: 'https://example.com/doctor2.jpg',
//       ),
//       // ... مواعيد سابقة أخرى
//     ]);
//   }
// }

import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';

import 'package:med_booking_system/data/data_sources/remote/patient/patient_appointments_data.dart';

import '../../../data/model/patient/appointment_model.dart';

class AppointmentController extends GetxController {
  PatientAppointmentsData homeData = PatientAppointmentsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List dataPatientAppointments = [];
  List<AppointmentModel> patientAppointmentsList = [];

  @override
  void onInit() async {
    super.onInit();
    await fetchAppointments();
    filtersAppointments.addAll(patientAppointmentsList);
  }

  fetchAppointments({DateTime? date}) async {
    dataPatientAppointments.clear();
    patientAppointmentsList.clear();
    statusRequest = StatusRequest.loading;

    // print(
    //   "===========================$dateStr==================================",
    // );
    var response = await homeData.getAllAppointmentssData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataPatientAppointments.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        print("lll ${dataPatientAppointments.length}");
        for (int i = 0; i < dataPatientAppointments.length; i++) {
          patientAppointmentsList.add(
            AppointmentModel.fromJson(dataPatientAppointments[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  String selectedFilter = 'All';
  List<AppointmentModel> filtersAppointments = [];

  void filterAppointments(String filter) {
    selectedFilter = filter;
    filtersAppointments.clear();

    if (filter == "All") {
      filtersAppointments.addAll(patientAppointmentsList);
      print(
        "======filtersAppointments====$filtersAppointments===================",
      );
    } else {
      filtersAppointments.addAll(
        patientAppointmentsList.where((appt) {
          return appt.status.toLowerCase() == filter.toLowerCase();
        }),
      );
       print(
        "======filtersAppointments====$filtersAppointments===================",
      );
      
    }
print(filtersAppointments.length);
   
    // if (filter == 'All') {
    //   patientAppointmentsList = List.from(allAppointments);
    //       print("======patientAppointmentsList====$patientAppointmentsList===================");

    // } else {
    //   patientAppointmentsList = allAppointments.where((appt) {
    //     return appt.status.toLowerCase() == filter.toLowerCase();
    //   }).toList();
    // }

    update();
  }
}
