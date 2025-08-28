import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/data/data_sources/static/doctor_center.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';

class CenterDetailsController extends GetxController {
  late CenterDetailsModel center;

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
