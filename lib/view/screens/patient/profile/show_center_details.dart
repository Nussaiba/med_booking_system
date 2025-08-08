// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/core/constants/routes.dart';
// import 'package:med_booking_system/data/data_sources/static/doctor_center.dart';
// import 'package:med_booking_system/data/model/all_model.dart';

// class CenterDetailsController extends GetxController {
//   late CenterModel center;

//   String get workingHours {
//     return '${center.workingStart.format(Get.context!)} - ${center.workingEnd.format(Get.context!)}';
//   }

//   String get workingDaysFormatted {
//     return center.workingDays.join(', ');
//   }

//   var isFavorite = false.obs;

//   void toggleFavorite() {
//     isFavorite.toggle();
//     // هنا يمكنك إضافة منطق لحفظ التفضيل في قاعدة البيانات
//   }

//   @override
//   void onInit() {
//     center = centersList[0];
//     // center = Get.arguments['center'];
//     super.onInit();
//   }
// }

// class CenterDetailsScreen extends StatelessWidget {
//   const CenterDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CenterDetailsController());
//     final center = controller.center;
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 280,
//             flexibleSpace: _HeaderImage(center: center),
//             pinned: true,
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             leading: IconButton(
//               icon: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: colorScheme.surface.withOpacity(0.7),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.arrow_back),
//               ),
//               onPressed: () => Get.back(),
//             ),
//             actions: [
//               _ActionButton(
//                 icon: Obx(
//                   () => Icon(
//                     controller.isFavorite.value
//                         ? Icons.favorite
//                         : Icons.favorite_border,
//                     color:
//                         controller.isFavorite.value
//                             ? Colors.red
//                             : colorScheme.onSurface,
//                   ),
//                 ),
//                 onPressed: controller.toggleFavorite,
//               ),
//               _ActionButton(
//                 icon: Icon(Icons.share, color: colorScheme.onSurface),
//                 onPressed: () => _shareCenter(center),
//               ),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: _CenterDetailsContent(
//               center: center,
//               controller: controller,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _BookButton(center: center),
//     );
//   }

//   void _shareCenter(CenterModel center) {
//     // منطق المشاركة
//   }
// }

// // مكونات الواجهة الفرعية
// class _HeaderImage extends StatelessWidget {
//   final CenterModel center;
//   const _HeaderImage({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//          Image.asset(
//           center.imageUrl,
//           fit: BoxFit.cover,
//           // loadingBuilder: (context, child, progress) {
//           //   return progress == null
//           //       ? child
//           //       : Container(color: Colors.grey[200]);
//           // },
//         ),
//         // Image.network(
//         //   center.imageUrl,
//         //   fit: BoxFit.cover,
//         //   loadingBuilder: (context, child, progress) {
//         //     return progress == null
//         //         ? child
//         //         : Container(color: Colors.grey[200]);
//         //   },
//         // ),
//         DecoratedBox(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: [Colors.black.withOpacity(0.7), Colors.transparent],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ActionButton extends StatelessWidget {
//   final Widget icon;
//   final VoidCallback onPressed;
//   const _ActionButton({required this.icon, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: IconButton(
//         icon: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
//             shape: BoxShape.circle,
//           ),
//           child: icon,
//         ),
//         onPressed: onPressed,
//       ),
//     );
//   }
// }

// class _CenterDetailsContent extends StatelessWidget {
//   final CenterModel center;
//   final CenterDetailsController controller;
//   const _CenterDetailsContent({required this.center, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Container(
//       decoration: BoxDecoration(
//         color: colorScheme.surface,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _CenterTitle(center: center),
//           const SizedBox(height: 16),
//           _AddressSection(center: center),
//           const SizedBox(height: 24),
//           _SpecialtiesSection(center: center),
//           const SizedBox(height: 24),
//           _WorkingHoursSection(controller: controller),
//           const SizedBox(height: 24),
//           _LocationSection(center: center),
//           const SizedBox(height: 40), // مساحة للزر الموجود في الأسفل
//         ],
//       ),
//     );
//   }
// }

// class _CenterTitle extends StatelessWidget {
//   final CenterModel center;
//   const _CenterTitle({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 center.name,
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.onSurface,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.amber, size: 20),
//                   const SizedBox(width: 4),
//                   Text(
//                     center.rating.toString(),
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '(${center.isFeatured ? 'مميز' : 'عادي'})',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color:
//                           center.isFeatured
//                               ? Theme.of(context).colorScheme.primary
//                               : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _AddressSection extends StatelessWidget {
//   final CenterModel center;
//   const _AddressSection({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           Icons.location_on,
//           color: Theme.of(context).colorScheme.primary,
//           size: 20,
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             center.address,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SpecialtiesSection extends StatelessWidget {
//   final CenterModel center;
//   const _SpecialtiesSection({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'التخصصات الطبية',
//           style: Theme.of(
//             context,
//           ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children:
//               center.specialties
//                   .map(
//                     (specialty) => Chip(
//                       label: Text(
//                         specialty,
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.onPrimary,
//                         ),
//                       ),
//                       backgroundColor: Theme.of(context).colorScheme.primary,
//                     ),
//                   )
//                   .toList(),
//         ),
//       ],
//     );
//   }
// }

// class _WorkingHoursSection extends StatelessWidget {
//   final CenterDetailsController controller;
//   const _WorkingHoursSection({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'أوقات العمل',
//           style: Theme.of(
//             context,
//           ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.surfaceVariant,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: [
//               _InfoRow(
//                 icon: Icons.calendar_today,
//                 text: controller.workingDaysFormatted,
//               ),
//               const SizedBox(height: 8),
//               _InfoRow(icon: Icons.access_time, text: controller.workingHours),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _InfoRow extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   const _InfoRow({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
//         const SizedBox(width: 12),
//         Text(text, style: Theme.of(context).textTheme.bodyMedium),
//       ],
//     );
//   }
// }

// class _LocationSection extends StatelessWidget {
//   final CenterModel center;
//   const _LocationSection({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'الموقع',
//           style: Theme.of(
//             context,
//           ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Container(
//             height: 180,
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Stack(
//               children: [
//             //     Image.network(
//             //       'https://maps.googleapis.com/maps/api/staticmap?center=${center.location}&zoom=15&size=600x300&markers=color:red%7C${center.location}&key=YOUR_API_KEY',
//             //       fit: BoxFit.cover,
//             //       width: double.infinity,
//             //     ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: FloatingActionButton.small(
//                       onPressed: () {
//                         // فتح خرائط جوجل
//                       },
//                       child: const Icon(Icons.navigation),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BookButton extends StatelessWidget {
//   final CenterModel center;
//   const _BookButton({required this.center});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               backgroundColor: Theme.of(context).colorScheme.primary,
//             ),
//             onPressed: () {
//               Get.toNamed(
//                 AppRoute.bookingFromCenterScreen,
//                 arguments: {'center': center},
//               );
//             },
//             child: Text(
//               'حجز موعد',
//               style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                 color: Theme.of(context).colorScheme.onPrimary,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/data/data_sources/static/doctor_center.dart';
import 'package:med_booking_system/data/model/all_model.dart';

class CenterDetailsController extends GetxController {
  late CenterModel center;

  String get workingHours {
    return '${center.workingStart.format(Get.context!)} - ${center.workingEnd.format(Get.context!)}';
  }

  String get workingDaysFormatted {
    return center.workingDays.join(', ');
  }

  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.toggle();
  }

  @override
  void onInit() {
    center = centersList[0];
    super.onInit();
  }
}

class CenterDetailsScreen extends StatelessWidget {
  const CenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CenterDetailsController());
    final center = controller.center;
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            flexibleSpace: _HeaderImage(center: center),
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.blue),
              ),
              onPressed: () => Get.back(),
            ),
            actions: [
              _ActionButton(
                icon: Obx(
                  () => Icon(
                    controller.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: controller.isFavorite.value ? Colors.red : Colors.blue,
                  ),
                ),
                onPressed: controller.toggleFavorite,
              ),
              _ActionButton(
                icon: const Icon(Icons.share, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _CenterDetailsContent(
              center: center,
              controller: controller,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BookButton(center: center),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final CenterModel center;
  const _HeaderImage({required this.center});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(center.imageUrl, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  const _ActionButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class _CenterDetailsContent extends StatelessWidget {
  final CenterModel center;
  final CenterDetailsController controller;
  const _CenterDetailsContent({required this.center, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CenterTitle(center: center),
          const SizedBox(height: 16),
          _InfoSection(icon: Icons.location_on, text: center.address),
          const SizedBox(height: 24),
          _SpecialtiesSection(center: center),
          const SizedBox(height: 24),
          _WorkingHoursSection(controller: controller),
          const SizedBox(height: 24),
          _MapPlaceholder(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _CenterTitle extends StatelessWidget {
  final CenterModel center;
  const _CenterTitle({required this.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      center.name,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.blue[900],
          ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoSection({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }
}

class _SpecialtiesSection extends StatelessWidget {
  final CenterModel center;
  const _SpecialtiesSection({required this.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Specialties", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: center.specialties
              .map(
                (s) => Chip(
                  label: Text(s, style: const TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blue,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _WorkingHoursSection extends StatelessWidget {
  final CenterDetailsController controller;
  const _WorkingHoursSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Working Hours", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _InfoSection(icon: Icons.calendar_today, text: controller.workingDaysFormatted),
              const SizedBox(height: 8),
              _InfoSection(icon: Icons.access_time, text: controller.workingHours),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Text("Map Placeholder")),
        ),
      ],
    );
  }
}

class _BookButton extends StatelessWidget {
  final CenterModel center;
  const _BookButton({required this.center});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Get.toNamed(
                AppRoute.bookingFromCenterScreen,
                arguments: {'center': center},
              );
            },
            child: const Text(
              "Book Now",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
