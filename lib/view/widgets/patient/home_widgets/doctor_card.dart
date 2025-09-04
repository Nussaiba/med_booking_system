// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/core/constants/routes.dart';
// import 'package:med_booking_system/data/model/all_model.dart';

// class DoctorCard extends StatelessWidget {
//   final DoctorModel doctor;

//   const DoctorCard({super.key, required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Get.toNamed(
//           AppRoute.showDoctorProfileByOther,

//           arguments: {'doctor': doctor},
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(0, 2, 0, 6),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               children: [
//                 // الصورة (ثلث البطاقة)
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                           doctor.profileImage,
//                           fit: BoxFit.cover,
//                           height: 100,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 // المعلومات (ثلثي البطاقة)
//                 Expanded(
//                   flex: 2,

//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         doctor.specialty,
//                         style: TextStyle(
//                           fontSize: 12, // تصغير حجم الخط

//                           color: Colors.grey[400],
//                           fontStyle: FontStyle.italic,
//                           height: 1.75,
//                         ),
//                       ),

//                       // Doctor's Name
//                       Text(
//                         doctor.fullName,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 2),

//                       // Rating
//                       _buildInfoRow(
//                         icon: Icons.star,
//                         inonColor: Colors.amber,
//                         text:
//                             '${doctor.rating}+ (${doctor.reviewCount} reviews)',
//                       ),
//                       const SizedBox(height: 1),

//                       // Working Hours
//                       // _buildInfoRow(
//                       //   icon: Icons.access_time,
//                       //   text: doctor.,
//                       // ),
//                       // const SizedBox(height: 4),

//                       // Experience
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200], // لون رمادي فاتح
//                               borderRadius: BorderRadius.circular(
//                                 12,
//                               ), // حواف منحنية
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.work,
//                                   size: 12,
//                                   color: Colors.grey[400],
//                                 ),

//                                 Text(
//                                   ' ${doctor.yearsExperience} years',
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Spacer(),
//                         ],
//                       ),

//                       // // Book Button
//                       // CustomButton(text: 'Book Appointment',),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _buildInfoRow({
//   required IconData icon,
//   Color color = Colors.grey,
//   Color inonColor = Colors.grey,

//   required String text,
// }) {
//   return Row(
//     children: [
//       Icon(icon, size: 12, color: inonColor),
//       const SizedBox(width: 6),
//       Text(
//         text,
//         style: TextStyle(
//           fontSize: 10, // تصغير حجم الخط
//           color: color,
//         ),
//       ),
//     ],
//   );
// }
