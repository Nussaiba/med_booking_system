class Doctor {
  final int id;
  final String name;
  final String specialty;
  final int? experience;
  final String about;
  final List<WorkingHour> workingHours;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    this.experience,
    required this.about,
    required this.workingHours,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      experience: json['experience'],
      about: json['about'] ?? "",
      workingHours: (json['working_hours'] as List)
          .map((e) => WorkingHour.fromJson(e))
          .toList(),
    );
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
}
