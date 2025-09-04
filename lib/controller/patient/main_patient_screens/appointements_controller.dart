import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
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
    // filtersAppointments.addAll(patientAppointmentsList);
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
        filterAppointments('All');
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

    update();
  }

 void showCancelAppointmentDialog(AppointmentModel appointment) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const Center(
              child: Text(
                'Cancel Appointment',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF555555),
                ),
              ),
            ),

            const SizedBox(height: 12.0),

            const Text(
              'Are you sure you want to cancel this appointment?',
              style: TextStyle(
                fontSize: 15.0,
                height: 1.4,
                color: Color(0xFF666666),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12.0),

          
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Doctor', appointment.doctorName),
                  _buildDetailRow('Center', appointment.centerName),
                  _buildDetailRow(
                    'Date',
                    _formatDate(appointment.requestedDate),
                  ),
                  _buildDetailRow('Time', appointment.requestedTime),
                  if (appointment.notes != null && appointment.notes!.isNotEmpty)
                    _buildDetailRow('Notes', appointment.notes!),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(result: false),
                  child: const Text(
                    'Keep',
                    style: TextStyle(color: Color(0xFF666666)),
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () => Get.back(result: true),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF0F0F0),
                  ),
                  child: const Text(
                    'Cancel Appointment',
                    style: TextStyle(color: Color(0xFF666666)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  ).then((value) {
    if (value == true) {
      cancelPendingAppointment(appointment.id.toString());
    }
  });
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
    child: RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFF555555),
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: value),
        ],
      ),
    ),
  );
}

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}

  cancelPendingAppointment(String appointmentId) async {
    print("cancelPendingAppointment$appointmentId");
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.cancelPendingAppointment(appointmentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print({response['data']});
 CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
  fetchAppointments();
      } else {
      if (response['status'] == 422) {
        print({response['data']});
 CustomSnackbar.show(
          title: "false",
          message: "${response['message']}",
          isSuccess: false,
        );

        // getDoctorCenters();
        // statusRequest = StatusRequest.failure;
      }}
      update();
    }
  }
}
