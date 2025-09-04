class CenterDetailsModel {
  final int id;
  final String name;
  final String address;
  final String? phone;
  final List<SpecialtyModel> specialties;

  CenterDetailsModel({
    required this.id,
    required this.name,
    required this.address,
    this.phone,
    required this.specialties,
  });

  factory CenterDetailsModel.fromJson(Map<String, dynamic> json) {
    return CenterDetailsModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      specialties: (json['specialties'] as List)
          .map((e) => SpecialtyModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "phone": phone,
      "specialties": specialties.map((e) => e.toJson()).toList(),
    };
  }
}

class SpecialtyModel {
  final int id;
  final String name;
  final List<DoctorCenterModel> doctors;

  SpecialtyModel({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      id: json['id'],
      name: json['name'],
      doctors: (json['doctors'] as List)
          .map((e) => DoctorCenterModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "doctors": doctors.map((e) => e.toJson()).toList(),
    };
  }
}

class DoctorCenterModel {
  final int id;
  final String name;
  final String specialty;
  final int? experience;
  final String about;
  final List<WorkingHourModel> workingHours;

  DoctorCenterModel({
    required this.id,
    required this.name,
    required this.specialty,
    this.experience,
    required this.about,
    required this.workingHours,
  });

  factory DoctorCenterModel.fromJson(Map<String, dynamic> json) {
    return DoctorCenterModel(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      experience: json['experience'],
      about: json['about'] ?? "",
      workingHours: (json['working_hours'] as List)
          .map((e) => WorkingHourModel.fromJson(e))
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
      "working_hours": workingHours.map((e) => e.toJson()).toList(),
    };
  }
}

class WorkingHourModel {
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  WorkingHourModel({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory WorkingHourModel.fromJson(Map<String, dynamic> json) {
    return WorkingHourModel(
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
