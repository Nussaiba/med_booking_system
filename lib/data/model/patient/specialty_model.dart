class SpecialtyModel {
  final int id;
  final String name;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final int doctorsCount;

  SpecialtyModel({
    required this.id,
    required this.name,
    // required this.createdAt,
    // required this.updatedAt,
    required this.doctorsCount,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      id: json['id'],
      name: json['name'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      doctorsCount: json['doctors_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
      'doctors_count': doctorsCount,
    };
  }
}
