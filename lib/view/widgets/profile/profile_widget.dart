import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/constants/routes.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String? birthDate;
  final String? bloodType;
  final String? imageUrl;
  final VoidCallback? onEdit;
  final bool isNetworkImage;
  final int ?age;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.birthDate,
    this.bloodType,
    this.imageUrl,
    this.onEdit,
    this.isNetworkImage = false, required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final int age = DateTime.now().year - birthDate.year;

    ImageProvider? imageProvider;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      imageProvider =
          isNetworkImage ? NetworkImage("${AppLink.serverimage}/$imageUrl") : AssetImage(AppImageAsset.doctor2) as ImageProvider;
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
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade100, width: 2),
              color: Colors.grey[200],
            ),
            child: imageProvider != null
                ? ClipOval(
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
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
                        bloodType!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
          if (onEdit != null)
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 22, color: Colors.blue),
              onPressed: onEdit,
            ),

             IconButton(
                  icon:  Icon(Icons.logout, size: 22, color: Colors.blue),
                  onPressed:(){ Get.offAllNamed(AppRoute.login);}
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
