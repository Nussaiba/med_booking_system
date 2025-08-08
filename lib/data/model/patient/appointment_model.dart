class AppointmentModel {
  final int id;
  final String doctorName;
  final String centerName;
  final DateTime requestedDate;
  final String requestedTime;
  final String status;
  final String? notes;
  final DateTime createdAt;

  AppointmentModel({
    required this.id,
    required this.doctorName,
    required this.centerName,
    required this.requestedDate,
    required this.requestedTime,
    required this.status,
    this.notes,
    required this.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctorName: json['doctor_name'],
      centerName: json['center_name'],
      requestedDate: DateTime.parse(json['requested_date']),
      requestedTime: json['requested_time'],
      status: json['status'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_name': doctorName,
      'center_name': centerName,
      'requested_date': requestedDate.toIso8601String().split('T').first,
      'requested_time': requestedTime,
      'status': status,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
