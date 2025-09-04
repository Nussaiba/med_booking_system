import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';
import 'package:med_booking_system/controller/patient/booking_controller/book_controller.dart';

class CenterBookingController extends GetxController {
  final CenterDetailsModel center;

  CenterBookingController({required this.center});

  var selectedSpecialty = Rxn<SpecialtyModel>();
  var selectedDoctor = Rxn<DoctorCenterModel>();

  void selectSpecialty(SpecialtyModel specialty) {
    selectedSpecialty.value = specialty;
    selectedDoctor.value = null;
  }

  void selectDoctor(DoctorCenterModel doctor) {
    selectedDoctor.value = doctor;
  }
}

class BookingByCenterPage extends StatelessWidget {
  final CenterDetailsModel center;

  const BookingByCenterPage({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CenterBookingController(center: center));

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Book at ${center.name}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardSection(
              icon: Icons.medical_services_rounded,
              color: Colors.purple,
              title: "Choose Specialty",
              child: Obx(
                () => DropdownButtonFormField<SpecialtyModel>(
                  value: controller.selectedSpecialty.value,
                  items: center.specialties
                      .map((s) =>
                          DropdownMenuItem(value: s, child: Text(s.name)))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) controller.selectSpecialty(val);
                  },
                  decoration: _dropdownDecoration(),
                ),
              ),
            ),

            const SizedBox(height: 14),

            _cardSection(
              icon: Icons.person_outline,
              color: Colors.indigo,
              title: "Choose Doctor",
              child: Obx(
                () => controller.selectedSpecialty.value == null
                    ? const Text("Please select a specialty first")
                    : DropdownButtonFormField<DoctorCenterModel>(
                        value: controller.selectedDoctor.value,
                        items: controller.selectedSpecialty.value!.doctors
                            .map((doc) => DropdownMenuItem(
                                  value: doc,
                                  child: Text("Dr ${doc.name}"),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) controller.selectDoctor(val);
                        },
                        decoration: _dropdownDecoration(),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            /// مكان الحجز داخل نفس الصفحة
            Obx(
              () => controller.selectedDoctor.value == null
                  ? const SizedBox.shrink()
                  : _BookingSection(
                      center: center,
                      doctor: controller.selectedDoctor.value!,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardSection({
    required IconData icon,
    required String title,
    required Widget child,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ]),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }
}

class _BookingSection extends StatelessWidget {
  final CenterDetailsModel center;
  final DoctorCenterModel doctor;

  const _BookingSection({required this.center, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      BookingController(center: center, doctor: doctor),
      tag: "${center.id}-${doctor.id}",
    );

    return Obx(
      () => Column(
        children: [
          _cardSection(
            icon: Icons.access_time,
            color: Colors.teal,
            title: "Working Hours",
            child: Column(
              children: doctor.workingHours
                  .map(
                    (wh) => ListTile(
                      dense: true,
                      leading: Icon(Icons.calendar_today,
                          color: Colors.teal.shade600, size: 18),
                      title: Text(
                        wh.dayOfWeek,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      subtitle: Text("${wh.startTime} - ${wh.endTime}",
                          style: const TextStyle(fontSize: 12)),
                    ),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(height: 14),

          _cardSection(
            icon: Icons.date_range,
            color: Colors.orange,
            title: "Pick Date",
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    controller.selectedDate.value == null
                        ? "No date selected"
                        : DateFormat("yyyy-MM-dd")
                            .format(controller.selectedDate.value!),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (picked != null) {
                      if (!controller.isDoctorAvailableOn(picked)) {
                        Get.snackbar("Notice", "Doctor not available this day");
                        return;
                      }
                      controller.selectedDate.value = picked;
                      controller.generateAvailableTimes();
                    }
                  },
                  icon: const Icon(Icons.edit_calendar, size: 18),
                  label: const Text("Select"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          _cardSection(
            icon: Icons.schedule,
            color: Colors.blue,
            title: "Pick Time",
            child: controller.availableTimes.isEmpty
                ? const Text("No available times")
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.availableTimes
                        .map(
                          (time) => ChoiceChip(
                            label: Text(time),
                            labelStyle: const TextStyle(fontSize: 12),
                            selected: controller.selectedTime.value == time,
                            selectedColor: Colors.blue.shade600,
                            backgroundColor: Colors.grey.shade200,
                            onSelected: (_) =>
                                controller.selectedTime.value = time,
                          ),
                        )
                        .toList(),
                  ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: controller.confirmBooking,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text("Confirm Booking"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardSection({
    required IconData icon,
    required String title,
    required Widget child,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ]),
      ),
    );
  }
}
