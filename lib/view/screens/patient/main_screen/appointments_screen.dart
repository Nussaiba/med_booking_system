// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/controller/patient/main_patient_screens/appointements_controller.dart';
// import 'package:med_booking_system/core/class/handling_view.dart';
// import 'package:med_booking_system/view/widgets/patient/appointment_widgets/app2_card.dart';

// class PatientAppointmentsScreen extends StatelessWidget {
//   final controller = Get.put(AppointmentController());

//   PatientAppointmentsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         appBar: AppBar(
//           title: Text(
//             "Appointments",
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//               letterSpacing: 0.3,
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.blue.shade500, Colors.blue.shade700],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//         ),
//         body: GetBuilder<AppointmentController>(
//           builder:
//               (controller) => Column(
//                 children: [
//                   Expanded(
//                     child: HandlingDataView(
//                       statusRequest: controller.statusRequest,
//                       widget: ListView.builder(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//                         itemCount: controller.patientAppointmentsList.length,
//                         itemBuilder: (context, index) {
//                           final appt =
//                               controller.patientAppointmentsList[index];
//                           return CustomPatientAppointmentCard(
//                             appt: appt,
//                             onTap: () {

//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/appointements_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/patient/appointment_widgets/app2_card.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  final controller = Get.put(AppointmentController());

  PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,

          title: const SizedBox.shrink(),
          actions: [_buildFilterDropdown()],
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                "My Appointments",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),

        body: GetBuilder<AppointmentController>(
          builder:
              (controller) => Column(
                children: [
                  // Filter selection indicator
                  if (controller.selectedFilter != 'All')
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_alt,
                            size: 16,
                            color: Colors.blue.shade600,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Filtering by: ${controller.selectedFilter}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child:
                            controller.patientAppointmentsList.isEmpty
                                ? _buildEmptyState()
                                : ScrollConfiguration(
                                  behavior: ScrollBehavior().copyWith(
                                    scrollbars: false,
                                    overscroll: false,
                                    physics: const BouncingScrollPhysics(),
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    itemCount:
                                        controller.filtersAppointments.length,
                                    itemBuilder: (context, index) {
                                      final appt =
                                          controller.filtersAppointments[index];
                                      return AnimatedOpacity(
                                        duration: Duration(
                                          milliseconds: 300 + (index * 100),
                                        ),
                                        opacity: 1,
                                        child: Transform.translate(
                                          offset: Offset(0, 0),
                                          child: CustomPatientAppointmentCard(
                                            appt: appt,
                                            onTap: () {
                                              // controller.onAppointmentTap(appt);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return GetBuilder<AppointmentController>(
      builder:
          (controller) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(
                  FontAwesomeIcons.sliders,
                  color: Colors.black87,
                  size: 18,
                ),
                elevation: 1,

                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.filterAppointments(newValue);
                  }
                },
                items:
                    <String>[
                      'All',
                      'Approved',
                      'Rejected',
                      'Pending',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
    );
  }

  Widget _buildEmptyState() {
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(scrollbars: false),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 80,
              color: Colors.blue.shade300,
            ),
            SizedBox(height: 20),
            Text(
              "No Appointments Yet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Book your first appointment to get started",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              ),
              child: Text(
                "Book Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



