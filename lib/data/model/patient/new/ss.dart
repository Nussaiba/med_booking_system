class SpecialtyWithCentersAndDoctorsModel {
  final int specialtyId;
  final String specialtyName;
  final List<CenterBySpecialtyModel> centers;

  SpecialtyWithCentersAndDoctorsModel({
    required this.specialtyId,
    required this.specialtyName,
    required this.centers,
  });

  factory SpecialtyWithCentersAndDoctorsModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyWithCentersAndDoctorsModel(
      specialtyId: json['specialty_id'],
      specialtyName: json['specialty_name'],
      centers: (json['centers'] as List)
          .map((e) => CenterBySpecialtyModel.fromJson(e))
          .toList(),
    );
  }
}

class CenterBySpecialtyModel {
  final int centerId;
  final String centerName;
  final String centerAddress;
  final List<DoctorInCenterModel> doctors;

  CenterBySpecialtyModel({
    required this.centerId,
    required this.centerName,
    required this.centerAddress,
    required this.doctors,
  });

  factory CenterBySpecialtyModel.fromJson(Map<String, dynamic> json) {
    return CenterBySpecialtyModel(
      centerId: json['center_id'],
      centerName: json['center_name'],
      centerAddress: json['center_address'],
      doctors: (json['doctors'] as List)
          .map((e) => DoctorInCenterModel.fromJson(e))
          .toList(),
    );
  }
}

class DoctorInCenterModel {
  final int doctorId;
  final String doctorName;
  final int ?experience;
  final String about;
  final List<WorkingHourModel> workingHours;

 DoctorInCenterModel ({
    required this.doctorId,
    required this.doctorName,
     this.experience,
    required this.about,
    required this.workingHours,
  });

  factory DoctorInCenterModel.fromJson(Map<String, dynamic> json) {
    return DoctorInCenterModel(
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
