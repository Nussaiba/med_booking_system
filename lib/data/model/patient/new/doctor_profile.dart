class DoctorProfile {
  final int id;
  final String name;
  final String specialty;
  final String? experience;
  final String about;
  final String certificate;
  final List<CenterModel> centers;

  DoctorProfile({
    required this.id,
    required this.name,
    required this.specialty,
    this.experience,
    required this.about,
    required this.certificate,
    required this.centers,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    return DoctorProfile(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      experience: json['experience'],
      about: json['about'],
      certificate: json['certificate'],
      centers: (json['centers'] as List)
          .map((c) => CenterModel.fromJson(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "specialty": specialty,
      "experience": experience,
      "about": about,
      "certificate": certificate,
      "centers": centers.map((c) => c.toJson()).toList(),
    };
  }
}

class CenterModel {
  final int centerId;
  final String centerName;
  final String centerAddress;
  final List<WorkingHour> workingHours;

  CenterModel({
    required this.centerId,
    required this.centerName,
    required this.centerAddress,
    required this.workingHours,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      centerId: json['center_id'],
      centerName: json['center_name'],
      centerAddress: json['center_address'],
      workingHours: (json['working_hours'] as List)
          .map((w) => WorkingHour.fromJson(w))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "center_id": centerId,
      "center_name": centerName,
      "center_address": centerAddress,
      "working_hours": workingHours.map((w) => w.toJson()).toList(),
    };
  }
}

class WorkingHour {
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  WorkingHour({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) {
    return WorkingHour(
      dayOfWeek: json['day_of_week'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "day_of_week": dayOfWeek,
      "start_time": startTime,
      "end_time": endTime,
    };
  }
}
