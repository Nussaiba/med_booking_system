import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/constants/color.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';

import 'package:med_booking_system/data/model/patient/paient_model.dart';

class ProfileHeader extends StatelessWidget {
  final PatientProfileModel patientProfile;
  final VoidCallback? onEdit;
  final bool isNetworkImage;

  const ProfileHeader({
    Key? key,
    required this.patientProfile,
    this.onEdit,
    this.isNetworkImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personalDetails = patientProfile.personal?.personalDetails;
    final medical = patientProfile.medical;
    final contactInfo = patientProfile.personal?.contactInfo;

    final String name = contactInfo?.email ?? "No Name";
    final String? birthDate = personalDetails?.birthdate;
    final int? age = personalDetails?.age ?? medical?.age;
    final String? bloodType = medical?.bloodType;
    // String? imageUrl = patientProfile.personal?.contactInfo?.imageUrl;

    ImageProvider? imageProvider;
    // if (imageUrl != null && imageUrl.isNotEmpty) {
    //   imageProvider = isNetworkImage
    //       ? NetworkImage("${AppLink.serverimage}/$imageUrl")
    //       : AssetImage(AppImageAsset.doctor2) as ImageProvider;
    // }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              color: Colors.grey[200],
            ),
            child:
                imageProvider != null
                    ? ClipOval(
                      child: Image(image: imageProvider, fit: BoxFit.cover),
                    )
                    : const Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                if (age != null)
                  Text(
                    'Age: $age',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                if (bloodType != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.bloodtype, size: 14, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        bloodType,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (onEdit != null)
            IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                size: 22,
                color: Colors.blue,
              ),
              onPressed: onEdit,
            ),
          IconButton(
            icon: Icon(Icons.logout, size: 22, color: Colors.blue),
            onPressed: () {
              Get.offAllNamed(AppRoute.login);
            },
          ),
        ],
      ),
    );
  }
}

Widget buildInfoSection({
  required String title,
  required IconData icon,
  required List<Widget> children,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[300], height: 24),
          Column(children: children),
        ],
      ),
    ),
  );
}

Widget buildInfoItem(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.blue[400]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class DoctorProfileHeader extends StatelessWidget {
  final DoctorProfileModel doctorProfileModel;
  final VoidCallback? onEdit;

  const DoctorProfileHeader({
    Key? key,
    required this.doctorProfileModel,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = doctorProfileModel.user;
    final doctorProfile = doctorProfileModel.doctorProfile;

    final String name = user.fullName;
    final String? birthDate = user.birthdate;
    final String? gender = user.gender;
    final String? address = user.address;
    final int? experience = doctorProfile.yearsOfExperience;
    final String? aboutMe = doctorProfile.aboutMe;
    final String? profilePhoto = user.profilePhoto;

    ImageProvider? imageProvider;
    if (profilePhoto != null && profilePhoto.isNotEmpty) {
      imageProvider = NetworkImage("${AppLink.serverimage}/$profilePhoto");
    } else {
      imageProvider =
          AssetImage('assets/images/doctor_placeholder.png') as ImageProvider;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              color: Colors.grey[200],
            ),
            child:
                imageProvider != null
                    ? ClipOval(
                      child: Image(image: imageProvider, fit: BoxFit.cover),
                    )
                    : const Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (experience != null)
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: AppColor.praimary2Color,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        ' $experience years',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (onEdit != null)
            IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                size: 22,
                color: Colors.blue,
              ),
              onPressed: onEdit,
            ),
          IconButton(
            icon: Icon(Icons.logout, size: 22, color: Colors.blue),
            onPressed: () {
              Get.offAllNamed(AppRoute.login);
            },
          ),
        ],
      ),
    );
  }
}
