import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/doctor_profile/show.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/view/widgets/General/custom_button.dart';
import 'package:med_booking_system/view/widgets/patient/show_doctor_profile/show_doctor_profile_by_other.dart';

class DoctorDetailsPage extends StatelessWidget {
  DoctorDetailsPage({super.key});

  final DoctorDetailsController controller = Get.put(DoctorDetailsController());
  @override
  Widget build(BuildContext context) {
    final doctor = controller.doctor;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const Text(
                "Doctor Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorInfoCard(
              profileImage: doctor.profileImage,
              fullName: doctor.fullName,
              specialty: doctor.specialty,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 32,
                children: [
                  InfoChip(
                    icon: Icons.groups,
                    label: "${doctor.totalPatients}+",
                    sub: "patients",
                  ),
                  InfoChip(
                    icon: Icons.event_available,
                    label: "${doctor.yearsExperience}+",
                    sub: "experience",
                  ),
                  InfoChip(
                    icon: Icons.star,
                    label: "${doctor.rating}",
                    sub: "rating",
                  ),
                  InfoChip(
                    icon: Icons.reviews,
                    label: "${doctor.reviewCount}",
                    sub: "reviews",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle("About me"),
                  Text(doctor.about, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 20),
                  SectionTitle("Centers"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          doctor.centers.map((center) {
                            return CenterCard(
                              name: center.name,
                              address: center.address,
                              workingStart: center.workingStart,
                              workingEnd: center.workingEnd,
                            );
                          }).toList(),
                    ),
                  ),

                  const SizedBox(height: 20),
                  SectionTitle("Reviews"),
                  Column(
                    children:
                        doctor.reviews.map((review) {
                          return ReviewCard(
                            reviewerName: review.reviewerName,
                            reviewerImage: review.reviewerImage,
                            stars: review.stars,
                            comment: review.comment,
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Book Appointment',
                    onTap: () {
                      Get.toNamed(
                        AppRoute.booking,
                        arguments: {'doctor': doctor},
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
