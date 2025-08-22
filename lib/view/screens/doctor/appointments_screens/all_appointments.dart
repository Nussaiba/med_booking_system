import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/curr_appointments_controller.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/past_appointments_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/doctor/appointments_widgets/past_appointments_widgets.dart';

class AllAppointmentsScreen extends StatelessWidget {
  final currentController = Get.put(CurrentAppointmentsController());
  final pastController = Get.put(PastAppointmentsController());
  AllAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade100,
            bottom: TabBar(
              indicatorColor: Colors.blue.shade600,
              labelColor: Colors.blue.shade800,
              unselectedLabelColor: Colors.grey.shade700,
              tabs: [Tab(text: "Current"), Tab(text: "Past")],
            ),
          ),
        ),

        body: SafeArea(
          child: TabBarView(
            children: [
              GetBuilder<CurrentAppointmentsController>(
                builder:
                    (controller) => Column(
                      children: [
                        FilterSection<CurrentAppointmentsController>(
                          controller: controller,
                          selectedDate: controller.selectedDate,
                          onTodayPressed: controller.showTodayAppointments,
                          onSelectDate: () => controller.pickDate(context),
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
                                final appt =
                                    controller.filteredAppointments[index];
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

              GetBuilder<PastAppointmentsController>(
                builder:
                    (controller) => Column(
                      children: [
                        FilterSection<PastAppointmentsController>(
                          controller: controller,
                          selectedDate: controller.selectedDate,
                          onSelectDate: () => controller.pickDate(context),
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
                              itemCount:
                                  controller.doctorAppointmentsList.length,
                              itemBuilder: (context, index) {
                                final appt =
                                    controller.doctorAppointmentsList[index];
                                return CustomAppointmentCard(appt: appt);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
