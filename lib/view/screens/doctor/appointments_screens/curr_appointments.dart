import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/curr_appointments_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/doctor/appointments_widgets/past_appointments_widgets.dart';

class CurrentAppointmentsScreen extends StatelessWidget {
  final controller = Get.put(CurrentAppointmentsController());

  CurrentAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade500, Colors.blue.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GetBuilder<CurrentAppointmentsController>(
        builder:
            (controller) => Column(
              children: [
                FilterSection<CurrentAppointmentsController>(
                  controller: controller,
                  selectedDate: controller.selectedDate,
                  onTodayPressed: controller.showTodayAppointments,
                  onSelectDate: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) controller.setDateFilter(picked);
                  },
                  onClear: () => controller.setDateFilter(null),
                ),

                Expanded(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      itemCount: controller.filteredAppointments.length,
                      itemBuilder: (context, index) {
                        final appt = controller.filteredAppointments[index];
                        return CustomAppointmentCard(
                          appt: appt,
                          onTap: () {
                            controller.onAppointmentTap(appt);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

