// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/controller/aapointmwnts_controller/past_appointments_controller.dart';
// import 'package:med_booking_system/core/class/handling_view.dart';
// import 'package:med_booking_system/view/widgets/doctor/appointments_widgets/past_appointments_widgets.dart';


// class PastAppointmentsScreen extends StatelessWidget {
//   final controller = Get.put(PastAppointmentsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: Text(
//           "Past Appointments",
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             letterSpacing: 0.3,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade500, Colors.blue.shade700],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: GetBuilder<PastAppointmentsController>(
//         builder: (controller) => Column(
//           children: [
//             // FilterSection(controller: controller),
//             FilterSection<PastAppointmentsController>(
//   controller: controller,
//   selectedDate: controller.selectedDate,
//   onSelectDate: () async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: controller.selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) controller.setDateFilter(picked);
//   },
//   onClear: () => controller.setDateFilter(null),
// ),

//             Expanded(
//               child: HandlingDataView(
//                 statusRequest: controller.statusRequest,
//                 widget: ListView.builder(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   itemCount: controller.doctorAppointmentsList.length,
//                   itemBuilder: (context, index) {
//                     final appt = controller.doctorAppointmentsList[index];
//                     return CustomAppointmentCard(appt: appt);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
