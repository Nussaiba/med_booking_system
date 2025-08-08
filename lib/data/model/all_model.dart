import 'package:flutter/material.dart';

class DoctorModel {
  final String id;
  final String fullName;
  final String specialty;
  final String profileImage;
  final String about;
  final int totalPatients;
  final int yearsExperience;
  final double rating;
  final int reviewCount;
  final List<ReviewModel> reviews;
  final List<CenterModel> centers;
  final int appointmentDuration;  // مدة الموعد بالدقائق

  DoctorModel({
    required this.id,
    required this.fullName,
    required this.specialty,
    required this.profileImage,
    required this.about,
    required this.totalPatients,
    required this.yearsExperience,
    required this.rating,
    required this.reviewCount,
    required this.reviews,
    required this.centers,
    required this.appointmentDuration,
  });
}

class CenterModel {
  final String id;
  final String name;
  final String address;
  final String location;
  final String imageUrl;
  final double rating;
  final List<String> specialties;
  final bool isFeatured;
  final List<String> workingDays;   // ["Monday", "Tuesday", ...]
  final TimeOfDay workingStart;     // بداية دوام
  final TimeOfDay workingEnd;       // نهاية دوام

  CenterModel({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.specialties,
    this.isFeatured = false,
    required this.workingDays,
    required this.workingStart,
    required this.workingEnd,
  });
}

class ReviewModel {
  final String reviewerName;
  final String reviewerImage;
  final int stars;
  final String comment;

  ReviewModel({
    required this.reviewerName,
    required this.reviewerImage,
    required this.stars,
    required this.comment,
  });
}
