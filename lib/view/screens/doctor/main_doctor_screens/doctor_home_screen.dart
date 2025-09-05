import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/home_doctor_controller.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/data/model/doctor/doctor_invitation_mode;.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/view/screens/patient/show_center_details.dart';
import 'package:med_booking_system/view/widgets/General/state_empty.dart';
import 'package:med_booking_system/view/widgets/doctor/appointments_widgets/appointments_widgets.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});

  final MainScreenController controller2 = Get.put(MainScreenController());
  final DoctorHomeControllerImp controller = Get.put(DoctorHomeControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeControllerImp>(
      builder:
          (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Scaffold(
              // backgroundColor: Colors.grey[50],
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: Column(
                      children: [
                        buildProfileHeader(controller.doctor),
                        const SizedBox(height: 10),
                      
                      ],
                    ),
                  ),
                ),
              ),

              body: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: ListView(
                  children: [
                    GreetingBar(),
                    const SizedBox(height: 20),
                    controller.doctorInvitationsList.isNotEmpty
                        ? CustomTitle(title: "Your Invitations")
                        : Container(),
                    controller.doctorInvitationsList.isNotEmpty
                        ? buildInvitationsSection(
                          controller.doctorInvitationsList,
                          controller,
                        )
                        : Container(),

                    CustomTitle(title: "Centers"),

                    buildSuggestedClinics(),
                    const SizedBox(height: 20),
                    CustomTitle(title: "Today's Schedule "),

                    const SizedBox(height: 20),
                    buildAppointments(),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget buildSuggestedClinics() {
    return SizedBox(
      height: Get.height * 0.26,
      child:
          controller.dataDoctorCenters.isEmpty
              ? buildEmptyState("No Centers Yet", null, Icons.local_hospital)
              : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.doctorCentersList.length,
                itemBuilder: (context, index) {
                  return MedicalCenterCard(
                    center: controller.doctorCentersList[index],
                  );
                },
              ),
    );
  }

  Widget buildAppointments() {
    return controller.doctorAppointmentsList.isEmpty
        ? buildEmptyState(
          "No Appoinments Yet",
          "you have not any appointments yet",
          Icons.event,
        )
        : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.doctorAppointmentsList.length,
          itemBuilder: (context, index) {
            final appointment = controller.doctorAppointmentsList[index];
            // return
            // AppointmentDoctorCard(appointment:  appointment , onTap:(){ controller.goToAppointmentDetails(appointment.id);});    }
            return CustomAppointmentCard(
              appt: appointment,
              onTap: () {
                controller.goToAppointmentDetails(appointment);
                print(appointment);
              },
            );
          },
        );
  }

  Widget buildProfileHeader(DoctorProfileModel? doctor) {
    return Container(
      padding: EdgeInsets.only(top: 18),

      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(color: Colors.blue.shade100, width: 2),
              image: DecorationImage(
                image: 
                
                doctor?.user.profilePhoto != null?
                NetworkImage("${AppLink.serverimage}/${doctor?.user.profilePhoto}"):
                AssetImage(AppImageAsset.doctor4),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, welcome back',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 2),
                Text(
                  "${doctor?.user.fullName}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Icon(FontAwesomeIcons.bell, color: Colors.blue, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class GreetingBar extends StatelessWidget {
  const GreetingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.waving_hand_outlined, size: 22, color: Colors.orange),
          SizedBox(width: 12),
          Text(
            'Have a good day with your patients',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class MedicalCenterCard extends StatelessWidget {
  final DoctorCenterModel center;
  const MedicalCenterCard({required this.center});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CenterDetailsScreen(), arguments: {'center': center});
      },
      child: SizedBox(
        width: Get.width * .88,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      // center.imageUrl,
                      AppImageAsset.center4,
                      width: Get.width * .84,

                      height: Get.height * 0.18,

                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.bookmark_border, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    center.centerName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          '4.5',
                          // center.rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (center.centerAddress != null)
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      center.centerAddress!,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildInvitationsSection(
  List<DoctorInvitationModel> invitations,
  DoctorHomeControllerImp controller,
) {
  return SizedBox(
    height: Get.height * 0.28,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: invitations.length,
      itemBuilder: (context, index) {
        final invitation = invitations[index];
        return DoctorInvitationCard(
          invitation: invitation,
          onAccept: () {
            controller.acceptInvitation(invitation.id.toString());
          },
          onReject: () {
            controller.rejectInvitation(invitation.id.toString());
          },
        );
      },
    ),
  );
}

class DoctorInvitationCard extends StatelessWidget {
  final DoctorInvitationModel invitation;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const DoctorInvitationCard({
    super.key,
    required this.invitation,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.blue[600],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    invitation.centerName ?? "Medical Center",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
                _buildExpiryTime(),
              ],
            ),

            const SizedBox(height: 8),

            /// Message
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                invitation.message ?? "Welcome to join our medical center.",
                style: TextStyle(fontSize: 12, color: Colors.blueGrey[800]),
              ),
            ),

            const SizedBox(height: 6),

            /// Details
            Wrap(
              spacing: 8,
              runSpacing: 0,
              children: [
                _buildDetailItem(
                  Icons.alternate_email,
                  "Invited by: ${invitation.invitedByName}",
                ),
                _buildDetailItem(
                  Icons.calendar_today,

                  "Sent: ${DateFormat('yyyy-MM-dd').format(invitation.createdAt)}",
                ),
                if (invitation.expiresAt != null)
                  _buildDetailItem(
                    Icons.timer,
                    "Expires in: ${_getTimeDifference(invitation.expiresAt!)}",
                  ),
              ],
            ),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onReject,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red[600],
                    side: BorderSide(color: Colors.red[200]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    textStyle: const TextStyle(fontSize: 11),
                  ),
                  child: const Text("Reject"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    textStyle: const TextStyle(fontSize: 11),
                    elevation: 1,
                  ),
                  child: const Text("Accept"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpiryTime() {
    if (invitation.expiresAt == null) return const SizedBox();
    final now = DateTime.now();
    final expiresAt = invitation.expiresAt!;
    if (expiresAt.isBefore(now)) {
      return _statusTag("Expired", Colors.red[600]!, Colors.red[50]!);
    }
    return _statusTag(
      "Valid • ${_getTimeDifference(expiresAt)}",
      Colors.green[700]!,
      Colors.green[50]!,
    );
  }

  Widget _statusTag(String text, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.blue[600]),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getTimeDifference(DateTime expiryDate) {
    final diff = expiryDate.difference(DateTime.now());
    if (diff.inDays > 0) return "${diff.inDays} days";
    if (diff.inHours > 0) return "${diff.inHours} hrs";
    if (diff.inMinutes > 0) return "${diff.inMinutes} min";
    return "Less than 1 min";
  }
}
