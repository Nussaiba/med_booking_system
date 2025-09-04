import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/controller/aapointmwnts_controller/appointments_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/profile/profile_widget.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorAppointmentDetailController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "تفاصيل الموعد",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<DoctorAppointmentDetailController>(
        builder: (controller) {
          final appointment = controller.appointment;
          final user = appointment?.patient;

          // تنسيق التاريخ والوقت
          String dateStr = "غير محدد";
          String timeStr = "غير محدد";
          if (appointment?.appointmentDate != null) {
            final dt = appointment!.appointmentDate;
            dateStr = DateFormat('dd MMM yyyy').format(dt);
            timeStr = DateFormat('hh:mm a').format(dt);
          }

          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // ===== Header Section =====
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 100, bottom: 30, left: 24, right: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade700, Colors.blue.shade500],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          // صورة المستخدم
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: ClipOval(
                              child: user?.profilePhoto != null
                                  ? Image.network(
                                      user!.profilePhoto!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.blue.shade200,
                                          child: const Icon(Icons.person, size: 40, color: Colors.white),
                                        );
                                      },
                                    )
                                  : Container(
                                      color: Colors.blue.shade200,
                                      child: const Icon(Icons.person, size: 40, color: Colors.white),
                                    ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user?.fullName ?? "غير معروف"}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                if (user?.email != null && user!.email!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.email_outlined, size: 14, color: Colors.white70),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            user.email!,
                                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (user?.phone != null && user!.phone!.isNotEmpty)
                                  Row(
                                    children: [
                                      const Icon(Icons.phone_outlined, size: 14, color: Colors.white70),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          user.phone!,
                                          style: const TextStyle(color: Colors.white70, fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.health_and_safety_rounded, color: Colors.white, size: 28),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ===== Details Section =====
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // معلومات الموعد
                        _buildInfoCard(
                          title: 'معلومات الموعد',
                          icon: Icons.event_note_rounded,
                          children: [
                            _buildInfoRow(Icons.calendar_today_rounded, 'التاريخ', dateStr),
                            const Divider(height: 20, thickness: 0.5),
                            _buildInfoRow(Icons.access_time_rounded, 'الوقت', timeStr),
                            const Divider(height: 20, thickness: 0.5),
                            _buildInfoRow(
                              Icons.verified_rounded,
                              'الحالة',
                              appointment?.status ?? "غير محدد",
                              statusColor: _getStatusColor(appointment?.status),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // الملاحظات
                        _buildInfoCard(
                          title: 'الملاحظات',
                          icon: Icons.note_alt_outlined,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.description_outlined, size: 22, color: Colors.grey),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      appointment?.notes?.isNotEmpty == true 
                                          ? appointment!.notes! 
                                          : "لا توجد ملاحظات",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: appointment?.notes?.isNotEmpty == true 
                                            ? Colors.grey[800] 
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // أزرار الإجراءات
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.chat_outlined, size: 18),
                                label: const Text("محادثة"),
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(color: Colors.blue.shade400),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.edit_calendar_rounded, size: 18),
                                label: const Text("تعديل"),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // دالة للحصول على لون الحالة
  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // بطاقة المعلومات
  Widget _buildInfoCard({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue.shade600, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  // صف المعلومات
  Widget _buildInfoRow(IconData icon, String title, String value, {Color? statusColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.grey),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: statusColor ?? Colors.blue.shade600,
            ),
          ),
        ],
      ),
    );
  }
}