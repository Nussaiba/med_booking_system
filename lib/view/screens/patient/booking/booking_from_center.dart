import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/data/data_sources/static/doctor_center.dart';
import 'package:med_booking_system/data/model/all_model.dart';

class BookingController extends GetxController {
  late List<DoctorModel> allDoctors;
  late CenterModel selectedCenter;

  var selectedSpecialty = "".obs;
  var selectedDoctor = Rx<DoctorModel?>(null);
  var selectedTime = "".obs;
  List<String> get specialties {
    return selectedCenter.specialties;
  }

  List<DoctorModel> get filteredDoctors {
    if (selectedSpecialty.value == "") return [];
    return allDoctors.where((doc) {
      bool hasSpecialty = doc.specialty == selectedSpecialty.value;
      bool worksInCenter = doc.centers.any((c) => c.id == selectedCenter.id);
      return hasSpecialty && worksInCenter;
    }).toList();
  }

  List<String> get availableTimes {
    if (selectedDoctor.value == null) return [];
    // نستخدم دوام المركز
    final start = selectedCenter.workingStart;
    final end = selectedCenter.workingEnd;
    // نجرب نطلع أوقات بفاصل 30 دقيقة (أو appointmentDuration)
    List<String> times = [];
    TimeOfDay time = start;
    while (_compareTime(time, end) < 0) {
      times.add(_formatTime(time));
      time = _addMinutes(time, selectedDoctor.value!.appointmentDuration);
    }
    return times;
  }

  int _compareTime(TimeOfDay a, TimeOfDay b) {
    if (a.hour != b.hour) return a.hour - b.hour;
    return a.minute - b.minute;
  }

  TimeOfDay _addMinutes(TimeOfDay time, int mins) {
    int totalMins = time.hour * 60 + time.minute + mins;
    int h = totalMins ~/ 60;
    int m = totalMins % 60;
    return TimeOfDay(hour: h, minute: m);
  }

  String _formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final minute = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  void selectSpecialty(String spec) {
    selectedSpecialty.value = spec;
    selectedDoctor.value = null;
    selectedTime.value = "";
  }

  void selectDoctor(DoctorModel doctor) {
    selectedDoctor.value = doctor;
    selectedTime.value = "";
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  bool get canConfirm =>
      selectedSpecialty.value.isNotEmpty &&
      selectedDoctor.value != null &&
      selectedTime.value.isNotEmpty;

  void confirmBooking() {
    // هنا تضع منطق إرسال الحجز
    print(
      "حجز تم على المركز: ${selectedCenter.name}\n"
      "التخصص: ${selectedSpecialty.value}\n"
      "الطبيب: ${selectedDoctor.value!.fullName}\n"
      "الوقت: ${selectedTime.value}",
    );
    Get.snackbar("نجاح", "تم حجز الموعد بنجاح");
  }

  @override
  void onInit() {
    allDoctors = doctorsList;
    selectedCenter = Get.arguments['center'];
    super.onInit();
  }
}

class BookingFromCenterScreen extends StatelessWidget {
  const BookingFromCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Scaffold(
      appBar: AppBar(title: const Text("حجز موعد")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "اختر الاختصاص",
                  border: OutlineInputBorder(),
                ),
                items:
                    controller.specialties
                        .map(
                          (spec) =>
                              DropdownMenuItem(value: spec, child: Text(spec)),
                        )
                        .toList(),
                value:
                    controller.selectedSpecialty.value.isEmpty
                        ? null
                        : controller.selectedSpecialty.value,
                onChanged: (val) {
                  if (val != null) controller.selectSpecialty(val);
                },
              ),
              const SizedBox(height: 16),

              // اختيار الطبيب
              DropdownButtonFormField<DoctorModel>(
                decoration: const InputDecoration(
                  labelText: "اختر الطبيب",
                  border: OutlineInputBorder(),
                ),
                items:
                    controller.filteredDoctors
                        .map(
                          (doc) => DropdownMenuItem(
                            value: doc,
                            child: Text(doc.fullName),
                          ),
                        )
                        .toList(),
                value: controller.selectedDoctor.value,
                onChanged: (val) {
                  if (val != null) controller.selectDoctor(val);
                },
              ),
              const SizedBox(height: 16),

              // اختيار الوقت
              Text(
                "اختر الوقت:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    controller.availableTimes.map((time) {
                      final isSelected = controller.selectedTime.value == time;
                      return ChoiceChip(
                        label: Text(time),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) controller.selectTime(time);
                        },
                      );
                    }).toList(),
              ),

              const Spacer(),

              ElevatedButton(
                onPressed:
                    controller.canConfirm
                        ? () {
                          controller.confirmBooking();
                        }
                        : null,
                child: const Text("تأكيد الحجز"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
