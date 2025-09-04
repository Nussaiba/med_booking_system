import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/patient/booking_controller/book_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';

class BookingScreen extends StatelessWidget {
  final CenterDetailsModel center;
  final DoctorCenterModel doctor;

  const BookingScreen({super.key, required this.center, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      BookingController(center: center, doctor: doctor),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          "Book with Dr ${doctor.name}",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade700,
      ),
      body: GetBuilder<BookingController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor Info
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            doctor.specialty,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blueGrey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.local_hospital,
                                color: Colors.blue.shade400,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "Center: ${center.name}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.redAccent.shade200,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "Address: ${center.address}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Working Hours
                    _sectionTitle("Working Hours"),
                    Column(
                      children:
                          doctor.workingHours
                              .map(
                                (wh) => ListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  leading: Icon(
                                    Icons.access_time,
                                    color: Colors.blue.shade400,
                                    size: 16,
                                  ),
                                  title: Text(
                                    wh.dayOfWeek,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${wh.startTime} - ${wh.endTime}",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 14),

                    /// Pick Date
                    _sectionTitle("Pick a Date"),
                    Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.selectedDate.value == null
                                  ? "No date selected"
                                  : DateFormat(
                                    "yyyy-MM-dd",
                                  ).format(controller.selectedDate.value!),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              final picked = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 30),
                                ),
                              );
                              if (picked != null) {
                                if (!controller.isDoctorAvailableOn(picked)) {
                                  Get.snackbar(
                                    "Notice",
                                    "Doctor is not available on this day",
                                    backgroundColor: Colors.red.shade100,
                                    colorText: Colors.red.shade900,
                                    margin: const EdgeInsets.all(12),
                                  );
                                  return;
                                }
                                controller.selectedDate.value = picked;
                                controller.generateAvailableTimes();
                              }
                            },
                            icon: const Icon(Icons.calendar_today, size: 14),
                            label: const Text(
                              "Select",
                              style: TextStyle(fontSize: 12),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              side: BorderSide(color: Colors.blue.shade300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    /// Pick Time
                    _sectionTitle("Pick a Time"),
                    Obx(
                      () =>
                          controller.availableTimes.isEmpty
                              ? const Text(
                                "No available times",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              )
                              : Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children:
                                    controller.availableTimes
                                        .map(
                                          (time) => ChoiceChip(
                                            label: Text(
                                              time,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            selected:
                                                controller.selectedTime.value ==
                                                time,
                                            onSelected:
                                                (_) =>
                                                    controller
                                                        .selectedTime
                                                        .value = time,
                                            selectedColor: Colors.blue.shade600,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            labelStyle: TextStyle(
                                              color:
                                                  controller
                                                              .selectedTime
                                                              .value ==
                                                          time
                                                      ? Colors.white
                                                      : Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                    ),
                    const SizedBox(height: 14),

                    /// Notes
                    _sectionTitle("Notes (Optional)"),
                    TextField(
                      controller: controller.notesController,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: "Add any notes for the doctor...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
      ),

      /// Confirm Button bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.confirmBooking,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 1,
            ),
            child: const Text(
              "Confirm Booking",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 2),
      child: Text(
        title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
