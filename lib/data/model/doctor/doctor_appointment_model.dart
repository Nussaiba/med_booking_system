class DoctorAppointmentModel {
  final int id;
  final int doctorId;
  final int? patientId;
  final DateTime appointmentDate;
  final String? appointmentTime;
  final String status;

  final String? attendanceStatus;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final Patient patient;

  DoctorAppointmentModel({
    required this.id,
    required this.doctorId,
    this.patientId,
   required  this.appointmentDate,
    this.appointmentTime,
    required this.status,
    // required this.bookedBy,
    this.attendanceStatus,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.patient,
  });

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
    return DoctorAppointmentModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      appointmentDate:  DateTime.parse(json['requested_date']),
      appointmentTime: json['appointment_time'],
      status: json['status'],
    
      attendanceStatus: json['attendance_status'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      patient: Patient.fromJson(json['patient']),
    );
  }
}

class Patient {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String ?profilePhoto;

  Patient({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profilePhoto,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      profilePhoto: json['profile_photo'],
    );
  }
}