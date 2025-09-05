import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';
import 'package:med_booking_system/data/model/patient/appointment_model.dart';
import 'package:med_booking_system/view/screens/doctor/appointments_screens/appoinments_details.dart';

class AppointmentDoctorCard extends StatelessWidget {
  final DoctorAppointmentModel appointment;
final void Function() onTap;
  const AppointmentDoctorCard({required this.appointment,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: Colors.blue.shade400.withOpacity(0.2),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap:onTap,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Expanded(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey.shade100,
                    // image:
                    //  DecorationImage(
                    //           image: AssetImage(AppImageAsset.enterPassword),
                    //           fit: BoxFit.fill,
                    //         )
                    // appointment.imageUrl != null
                    //     ? DecorationImage(
                    //       image: AssetImage(appointment.imageUrl!),
                    //       fit: BoxFit.fill,
                    //     )
                    //     : null,
                  ),
                  child: Icon(
                    Icons.medical_services,
                    size: 35,
                    color:  Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(width: 12),
              // Clinic Info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 4),
                        //   child: Text(
                        //     appointment.status,
                        //     style: TextStyle(
                        //       fontSize: 10,
                        //       color: Colors.grey.shade600,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        // ),
                        Spacer(),
    
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            appointment.status,
                            // _getStatusText(appointment.status),
                            style: TextStyle(
                              // color: _getStatusColor(appointment.status),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   appointment.doctorName,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    SizedBox(height: 4),
    
                    //  Text(
                    //   appointment.centerName,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 4),
                        // Text(
                        //   DateFormat(
                        //     'MMM d, y - h:mm a',
                        //   ).format(appointment.appointmentDate),
                        //   style: TextStyle(
                        //     fontSize: 10,
                        //     color: Colors.grey.shade800,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Spacer(),
    
                        //  if (appointment.status == AppointmentStatus.upcoming )  Icon(Icons.edit, size: 16,)
                      ],
                    ),
    
                    SizedBox(height: 8),
                  //   appointment.appointmentTime != null
                  //       ?  Row(children: [
                  //      Icon(
                  //         Icons.access_time,
                  //         size: 14,
                  //         color: Colors.grey.shade800,
                  //       ),
                  //       SizedBox(width: 4),
                  //  Text(
                  //         appointment.appointmentTime!,
                  //         style: TextStyle(
                  //           fontSize: 10,
                  //           color: Colors.grey.shade600,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       )
                      
                  //   ])  : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getStatusText(AppointmentModel appointmentModel) {
    String status = appointmentModel.status;
    switch (status) {
      // case AppointmentStatus.upcoming:
      //   return 'Upcoming';
      // case AppointmentStatus.completed:
      //   return 'Completed';
      // case AppointmentStatus.cancelled:
      //   return 'Cancelled';
      default:
        return '';
    }
  }

  // Color getStatusColor(AppointmentStatus status) {
  //   switch (status) {
  //     case AppointmentStatus.upcoming:
  //       return Colors.blue.shade400; // Softer blue
  //     case AppointmentStatus.completed:
  //       return Colors.green.shade400; // Softer green
  //     case AppointmentStatus.cancelled:
  //       return Colors.orange.shade400; // Softer orange instead of red
  //   }
  // }
}
