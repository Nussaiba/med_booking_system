class SpecialtyModel {
  final int specialtyId;
  final String specialtyName;
  final List<CenterModel> centers;

  SpecialtyModel({
    required this.specialtyId,
    required this.specialtyName,
    required this.centers,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      specialtyId: json['specialty_id'],
      specialtyName: json['specialty_name'],
      centers: (json['centers'] as List)
          .map((e) => CenterModel.fromJson(e))
          .toList(),
    );
  }
}

class CenterModel {
  final int centerId;
  final String centerName;
  final String centerAddress;
  final List<DoctorModel> doctors;

  CenterModel({
    required this.centerId,
    required this.centerName,
    required this.centerAddress,
    required this.doctors,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      centerId: json['center_id'],
      centerName: json['center_name'],
      centerAddress: json['center_address'],
      doctors: (json['doctors'] as List)
          .map((e) => DoctorModel.fromJson(e))
          .toList(),
    );
  }
}

class DoctorModel {
  final int doctorId;
  final String doctorName;
  final int experience;
  final String about;
  final List<WorkingHourModel> workingHours;

  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.experience,
    required this.about,
    required this.workingHours,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctor_id'],
      doctorName: json['doctor_name'],
      experience: json['experience'],
      about: json['about'],
      workingHours: (json['working_hours'] as List)
          .map((e) => WorkingHourModel.fromJson(e))
          .toList(),
    );
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
}
