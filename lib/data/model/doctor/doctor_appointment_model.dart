// class DoctorAppointmentModel {
//   final int id;
//   final int doctorId;
//   final int? patientId;
//   final DateTime appointmentDate;
//   final String? appointmentTime;
//   final String status;
//   final int bookedBy;
//   final String? attendanceStatus;
//   final String? notes;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   DoctorAppointmentModel({
//     required this.id,
//     required this.doctorId,
//     this.patientId,
//     required this.appointmentDate,
//     this.appointmentTime,
//     required this.status,
//     required this.bookedBy,
//     this.attendanceStatus,
//     this.notes,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
//     return DoctorAppointmentModel(
//       id: json['id'],
//       doctorId: json['doctor_id'],
//       patientId: json['patient_id'],
//       appointmentDate: DateTime.parse(json['appointment_date']),
//       appointmentTime: json['appointment_time'],
//       status: json['status'],
//       bookedBy: json['booked_by'],
//       attendanceStatus: json['attendance_status'],
//       notes: json['notes'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'doctor_id': doctorId,
//       'patient_id': patientId,
//       'appointment_date': appointmentDate.toIso8601String(),
//       'appointment_time': appointmentTime,
//       'status': status,
//       'booked_by': bookedBy,
//       'attendance_status': attendanceStatus,
//       'notes': notes,
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//     };
//   }
// }







class DoctorAppointmentModel {
  final int id;
  final int doctorId;
  final int? patientId;
  final DateTime appointmentDate;
  final String? appointmentTime;
  final String status;
  final int bookedBy;
  final String? attendanceStatus;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final User user;

  DoctorAppointmentModel({
    required this.id,
    required this.doctorId,
    this.patientId,
    required this.appointmentDate,
    this.appointmentTime,
    required this.status,
    required this.bookedBy,
    this.attendanceStatus,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
    return DoctorAppointmentModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      appointmentDate:  DateTime.parse(json['appointment_date']),
      appointmentTime: json['appointment_time'],
      status: json['status'],
      bookedBy: json['booked_by'],
      attendanceStatus: json['attendance_status'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String ?profilePhoto;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profilePhoto,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      profilePhoto: json['profile_photo'],
    );
  }
}