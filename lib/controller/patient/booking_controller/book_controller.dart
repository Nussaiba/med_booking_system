import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/appointements_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/booking_data.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';

class BookingController extends GetxController {
  final CenterDetailsModel center;
  final DoctorCenterModel doctor;

  late TextEditingController notesController;

  BookingData data = BookingData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  requestAppointment(
    String doctorId,
    String centerId,
    String requestedDate,
    String requestedTime,
    String? notes,
  ) async {
    // if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.requestAppointment(
      doctorId,
      centerId,
      requestedDate,
      requestedTime,
      notes,
    );

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      print("==========================${response["status"]}===========${response["status"]==422}========");
      if (response["status"] == 200) {
        final con = Get.find<AppointmentController>();
        con.fetchAppointments();
        update();
        CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
        Get.offAllNamed(AppRoute.mainPatientScreen);
      } else {
      
        if (response["status"] == 409 ||response["status"] == 422 ) {
            print(response["message"] );
        print(response["status"] );
          CustomSnackbar.show(
            title: "false",
            message: "${response['message']}",
            isSuccess: false,
          );
        }


        
        // Get.back();
      }
    } else {}
 update();

  }

  @override
  void onInit() {
    notesController = TextEditingController();
    super.onInit();
  }

  BookingController({required this.center, required this.doctor});

  var selectedDate = Rxn<DateTime>();
  var availableTimes = <String>[].obs;
  var selectedTime = RxnString();

  bool isDoctorAvailableOn(DateTime date) {
    final weekday = DateFormat('EEEE').format(date);
    return doctor.workingHours.any((wh) => wh.dayOfWeek == weekday);
  }

  void generateAvailableTimes() {
    if (selectedDate.value == null) return;

    final weekday = DateFormat('EEEE').format(selectedDate.value!);
    final workingHour = doctor.workingHours.firstWhereOrNull(
      (wh) => wh.dayOfWeek == weekday,
    );

    if (workingHour == null) {
      availableTimes.clear();
      return;
    }

    final start = _parseTime(workingHour.startTime);
    final end = _parseTime(workingHour.endTime);

    final slots = <String>[];
    var current = start;

    while (current.isBefore(end)) {
      slots.add(DateFormat("HH:mm").format(current));
      current = current.add(const Duration(minutes: 15));
    }

    availableTimes.assignAll(slots);
  }

  DateTime _parseTime(String time) {
    final parts = time.split(":");
    return DateTime(0, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
  }

  void confirmBooking() {
    if (selectedDate.value == null || selectedTime.value == null) {
      Get.snackbar(
        "Error",
        "Please select both date and time",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
      );
      return;
    }


    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        title: const Text(
          "Confirm Appointment",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
          textAlign: TextAlign.center,
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow("Center", center.name),
              _buildDetailRow("Address", center.address),
              _buildDetailRow("Doctor", doctor.name),

              _buildDetailRow(
                "Date",
                DateFormat("MMMM dd, yyyy").format(selectedDate.value!),
              ),
              _buildDetailRow("Time", selectedTime.value!),

              if (notesController.text.isNotEmpty)
                _buildDetailRow("notes", notesController.text),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              requestAppointment(
                doctor.id.toString(),
                center.id.toString(),
                DateFormat('yyyy-MM-dd').format(selectedDate.value!),
                selectedTime.value!,
                notesController.text,
              );

              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Confirm", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
