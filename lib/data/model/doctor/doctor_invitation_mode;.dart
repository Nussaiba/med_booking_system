class DoctorInvitationModel {
  final int id;
  final int centerId;
  final int doctorUserId;
  final int invitedBy;
  final String status;
  final String? message;
  final DateTime? expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorInvitationModel({
    required this.id,
    required this.centerId,
    required this.doctorUserId,
    required this.invitedBy,
    required this.status,
    this.message,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorInvitationModel.fromJson(Map<String, dynamic> json) {
    return DoctorInvitationModel(
      id: json['id'],
      centerId: json['center_id'],
      doctorUserId: json['doctor_user_id'],
      invitedBy: json['invited_by'],
      status: json['status'],
      message: json['message'],
      expiresAt: json['expires_at'] != null ? DateTime.tryParse(json['expires_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'center_id': centerId,
      'doctor_user_id': doctorUserId,
      'invited_by': invitedBy,
      'status': status,
      'message': message,
      'expires_at': expiresAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
