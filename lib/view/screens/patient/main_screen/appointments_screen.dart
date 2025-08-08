import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/appointements_screen_controller.dart';
import 'package:med_booking_system/data/model/appointment.dart';

class AppointmentsScreen extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مواعيدي'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'القادمة'),
              Tab(text: 'السابقة'),
            ],
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            _buildUpcomingAppointments(),
            _buildPastAppointments(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Obx(() => ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: controller.upcomingAppointments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) => _buildAppointmentCard(
        controller.upcomingAppointments[index],
        isUpcoming: true,
      ),
    ));
  }

  Widget _buildPastAppointments() {
    return Obx(() => ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: controller.pastAppointments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) => _buildAppointmentCard(
        controller.pastAppointments[index],
        isUpcoming: false,
      ),
    ));
  }

  Widget _buildAppointmentCard(Appointment appointment, {required bool isUpcoming}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
       // onTap: () => Get.to(AppointmentDetailsPage(appointment: appointment)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  // صورة الطبيب
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(appointment.imageUrl),
                  ),
                  const SizedBox(width: 16),
                  // معلومات الطبيب
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.doctorName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          appointment.specialty,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          appointment.clinicName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // حالة الموعد
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(appointment.status),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _getStatusText(appointment.status),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // تاريخ الموعد
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('dd MMM yyyy').format(appointment.dateTime),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('hh:mm a').format(appointment.dateTime),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              if (isUpcoming) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton('إلغاء', Icons.cancel, Colors.red),
                    _buildActionButton('تعديل', Icons.edit, Colors.blue),
                    _buildActionButton('تذكير', Icons.notifications, Colors.green),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color) {
    return TextButton.icon(
      icon: Icon(icon, size: 18, color: color),
      label: Text(text, style: TextStyle(color: color)),
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'upcoming': return Colors.blue;
      case 'completed': return Colors.green;
      case 'cancelled': return Colors.red;
      default: return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'upcoming': return 'قادم';
      case 'completed': return 'مكتمل';
      case 'cancelled': return 'ملغى';
      default: return '';
    }
  }
}