import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment {
  final String clinicName;
  final String address;
  final DateTime dateTime;
  final AppointmentStatus status;
  final String? type;
  final String? imageUrl;

  Appointment({
    required this.clinicName,
    required this.address,
    required this.dateTime,
    required this.status,
    this.type,
    this.imageUrl,
  });
}

enum AppointmentStatus { upcoming, completed, cancelled }

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getStatusColor(appointment.status).withOpacity(0.05),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle card tap
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Clinic Image
              Expanded(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                    image:
                        appointment.imageUrl != null
                            ? DecorationImage(
                              image: AssetImage(appointment.imageUrl!),
                              fit: BoxFit.fill,
                            )
                            : null,
                  ),
                  child:
                      appointment.imageUrl == null
                          ? Icon(
                            Icons.medical_services,
                            size: 30,
                            color: Colors.grey.shade400,
                          )
                          : null,
                ),
              ),
              SizedBox(width: 12),
              // Clinic Info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (appointment.type != null)
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                              appointment.type!,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          Spacer(),

                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                              _getStatusText(appointment.status),
                              style: TextStyle(
                                color: _getStatusColor(appointment.status),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    Text(
                      appointment.clinicName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      appointment.address,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 4),
                        Text(
                          DateFormat(
                            'MMM d, y - h:mm a',
                          ).format(appointment.dateTime),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                           if (appointment.status == AppointmentStatus.upcoming )  Icon(Icons.edit, size: 16,)
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),

              // More options button
            ],
          ),
        ),
      ),
    );
  }

  String _getStatusText(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.upcoming:
        return 'Upcoming';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.upcoming:
        return Colors.blue.shade400; // Softer blue
      case AppointmentStatus.completed:
        return Colors.green.shade400; // Softer green
      case AppointmentStatus.cancelled:
        return Colors.orange.shade400; // Softer orange instead of red
    }
  }
}
