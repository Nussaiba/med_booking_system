
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';

import 'package:med_booking_system/data/model/patient/appointment_model.dart';



class CustomPatientAppointmentCard extends StatelessWidget {
  final AppointmentModel appt;
  final void Function()? onTap;
 final void Function()? onTapCancel;
  const CustomPatientAppointmentCard({required this.appt, this.onTap, Key? key, this.onTapCancel})
    : super(key: key);

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFF10B981);
      case 'pending':
        return const Color(0xFFF59E0B);
      case 'rejected':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            elevation: 0.5,
            shadowColor: Colors.black.withOpacity(0.04),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    
                    Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF0F7FF),
                        image: DecorationImage(
                          image: AssetImage(AppImageAsset.center1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // المحتوى
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  appt.doctorName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Color(0xFF1F2937),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 4),
                              
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(appt.status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(appt.status),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  appt.status,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: _getStatusColor(appt.status),
                                  ),
                                ),
                              ],
                            ),
                          ),
                              
                            ],
                          ),
                          const SizedBox(height: 6),
                          
                       
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F9FF),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 11,
                                  color: Colors.blue.shade600,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  DateFormat('dd MMM yyyy').format(appt.requestedDate),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.access_time,
                                  size: 11,
                                  color: Colors.blue.shade600,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  appt.requestedTime,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  // color: const Color(0xFFF8FAFC),
                                  // borderRadius: BorderRadius.circular(4),
                                  // border: Border.all(
                                  //   color: const Color(0xFFE5E7EB),
                                  //   width: 0.5
                                  // ),
                                ),
                                child: Text(
                                  appt.centerName,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Icon(
                    //   Icons.arrow_forward_ios_rounded,
                    //   color: Colors.grey.shade500,
                    //   size: 12,
                    // ),



                    appt.status.toLowerCase()=='pending'?
      

                    IconButton(onPressed: onTapCancel, icon: Icon( Icons.close, size: 14,
                    
                    
                    
                    
                    )):Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}