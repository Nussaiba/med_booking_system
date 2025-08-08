class DoctorModel {
  final int id;
  final int userId;
  final String name;
  final String specialty;
  final int experience;
  final String about;
  final List<String> workingDays;

  DoctorModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.about,
    required this.workingDays,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      specialty: json['specialty'],
      experience: json['experience'],
      about: json['about'],
      workingDays: List<String>.from(json['working_days']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'specialty': specialty,
      'experience': experience,
      'about': about,
      'working_days': workingDays,
    };
  }
}
