import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/past_appointments_controller.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';

class CustomAppointmentCard extends StatelessWidget {
  final DoctorAppointmentModel appt;
  final void Function()? onTap;
  const CustomAppointmentCard({required this.appt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        elevation: 0,
        color
      : appt.attendanceStatus == "absent"
          ? Colors.red.shade50
          : Colors.blue.shade400.withOpacity(0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: const Color.fromRGBO(187, 222, 251, 1),
                backgroundImage:
                //  appt.user.profilePhoto != null
                // ? NetworkImage(appt.user.profilePhoto!)
                // :
                AssetImage(AppImageAsset.center1),
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            appt.patient != null&& appt.patient?.fullName != null ?      Text(
                      appt.patient!.fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.blue.shade800,
                      )):   Text(
                      " No Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 6),

                    Row(
                      children: [
                        Text(
                          DateFormat(
                            'dd MMM yyyy',
                          ).format(appt.appointmentDate),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            DateFormat('hh:mm a').format(appt.appointmentDate),

                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
          if(      appt.attendanceStatus == null )   Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 14,
                          color: Colors.green.shade400,
                        ),
                        SizedBox(width: 4),
                        Text(
                          appt.status,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                
                
                
                
                
                
             
SizedBox(height: 4),

if (appt.attendanceStatus != null) 
  Row(
    children: [
      Icon(
        Icons.circle,
        size: 14,
        color: appt.attendanceStatus == "present"
            ? Colors.green.shade400
            : Colors.red.shade400, 
      ),
      SizedBox(width: 4),
      Text(
        appt.attendanceStatus!.capitalizeFirst ?? appt.attendanceStatus!, 
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  ),

                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue.shade400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterSection<T> extends StatelessWidget {
  final T controller;
  final VoidCallback? onTodayPressed;
  final Future<void> Function()? onSelectDate;
  final DateTime? selectedDate;
  final VoidCallback? onClear;

  const FilterSection({
    required this.controller,
    this.onTodayPressed,
    this.onSelectDate,
    this.selectedDate,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.filter_list, color: Colors.blue.shade600, size: 18),
          SizedBox(width: 6),
          Text(
            "Filter by Date",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.blueGrey.shade700,
            ),
          ),
          Spacer(),

          if (onTodayPressed != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                ),
                onPressed: onTodayPressed,
                child: Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            ),
            onPressed: onSelectDate,
            icon: Icon(Icons.date_range, color: Colors.white, size: 16),
            label: Text(
              selectedDate != null
                  ? DateFormat('dd MMM').format(selectedDate!)
                  : "Select",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          if (selectedDate != null && onClear != null)
            IconButton(
              icon: Icon(Icons.clear, color: Colors.redAccent, size: 18),
              onPressed: onClear,
            ),
        ],
      ),
    );
  }
}
