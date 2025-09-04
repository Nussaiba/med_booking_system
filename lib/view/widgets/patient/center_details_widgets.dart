import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';
import 'package:med_booking_system/view/screens/patient/booking/booking_screen.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/home_screen.dart';
import 'package:med_booking_system/view/widgets/General/custom_button.dart';
import 'package:med_booking_system/view/widgets/patient/home_widgets/custom_main_title.dart';

class CenterBottomNavigationBar extends StatelessWidget {
  const CenterBottomNavigationBar({super.key, required this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.07,

      child: CustomButton(text: "Book Now", onTap: onTap),
    );
  }
}

class CenterAppBar extends StatelessWidget {
  const CenterAppBar({super.key, required this.center});
  final CenterDetailsModel? center;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: _HeaderImage(center: center),
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.9),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: IconButton(
              // icon: Obx(
              //   () =>
              icon: Icon(
                //     controller.isFavorite.value
                //         ?
                Icons.favorite,
                //         : Icons.favorite_border,
                //     color:
                //         controller.isFavorite.value
                //             ? Colors.red
                //             : Colors.blue,
              ),
              // ),
              onPressed: () {},
              // controller.toggleFavorite,
            ),
          ),
        ),
      ],
    );
  }
}

//HeaderImage
class _HeaderImage extends StatelessWidget {
  final CenterDetailsModel? center;
  const _HeaderImage({this.center});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppImageAsset.center1,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.transparent,
                Colors.transparent,
              ],
              stops: const [0.1, 0.5, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  "4.8 (124 reviews)",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CenterDetailsContent extends StatelessWidget {
  final CenterDetailsModel? center;
  const CenterDetailsContent({super.key, this.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CenterTitle(center: center),
          const SizedBox(height: 20),
          _InfoSection(icon: Iconsax.location, text: center?.address),
          if (center?.phone != null) ...[
            const SizedBox(height: 16),
            _InfoSection(icon: Iconsax.call, text: center?.phone),
          ],
          const SizedBox(height: 8),
          _InfoSection(icon: Iconsax.clock, text: "8:00 AM - 10:00 PM, Daily"),
          const SizedBox(height: 24),
          _SpecialtiesSection(center: center),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _CenterTitle extends StatelessWidget {
  final CenterDetailsModel? center;
  const _CenterTitle({this.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            "${center?.name}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(height: 12),
        center != null
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal:  10.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    center!.specialties.map((specialty) {
                      return _TagChip(text: specialty.name);
                    }).toList(),
              ),
            )
            : Container(),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;

  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Text(
        text,
        style: TextStyle(
          // color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final IconData icon;
  final String? text;
  const _InfoSection({required this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return text != null
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.blue, size: 20),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "$text",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )
        : Container();
  }
}

class _SpecialtiesSection extends StatelessWidget {
  final CenterDetailsModel? center;
  const _SpecialtiesSection({this.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: "Specialties & Doctors"),
        const SizedBox(height: 10),
        center != null
            ? Column(
              children:
                  center!.specialties.map((specialty) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),

                          title: Text(
                            specialty.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                          children:
                              specialty.doctors.map((doctor) {
                                return DoctorInCenterCard(
                                  center: center!,
                                  doctor: doctor,
                                );
                              }).toList(),
                        ),
                      ),
                    );
                  }).toList(),
            )
            : Container(),
      ],
    );
  }
}

class DoctorInCenterCard extends StatelessWidget {
  final DoctorCenterModel doctor;
  final CenterDetailsModel center;
  const DoctorInCenterCard({
    super.key,
    required this.doctor,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoute.showDoctorProfileByOther,

          arguments: {'doctor': doctor},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 2, 0, 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AppImageAsset.doctor1,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  flex: 4,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Text(
                            doctor.specialty,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.about,
                        style: TextStyle(
                          fontSize: 12,

                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      // Rating
                      // _buildInfoRow(
                      //   icon: Icons.star,
                      //   inonColor: Colors.amber,
                      //   text:
                      //       '${doctor.rating}+ (${doctor.reviewCount} reviews)',
                      // ),
                      // const SizedBox(height: 1),
                      if (doctor.workingHours.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              ...doctor.workingHours.map((w) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    bottom: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${w.dayOfWeek}: ${w.startTime} - ${w.endTime}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      const SizedBox(height: 4),

                      Row(
                        children: [
                          if (doctor.experience != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 12,
                                    color: Colors.grey[400],
                                  ),

                                  Text(
                                    ' ${doctor.experience} years',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                BookingScreen(center: center, doctor: doctor),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue[300]!,
                                      Colors.blue[600]!,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}
