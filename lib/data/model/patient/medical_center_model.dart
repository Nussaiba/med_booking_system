class MedicalCenterModel {
  final int id;
  final String name;
  final String address;
  final String? phone;
  final int doctorsCount;

  MedicalCenterModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.doctorsCount,
  });

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      doctorsCount: json['doctors_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'doctors_count': doctorsCount,
    };
  }
}









class DoctorCenterModel {
  final int centerId;
  final String centerName;
  final String? centerAddress;
  final List<String> workingDays;

  DoctorCenterModel({
    required this.centerId,
    required this.centerName,
    required this.centerAddress,
    required this.workingDays,
  });

  factory DoctorCenterModel.fromJson(Map<String, dynamic> json) {
    return DoctorCenterModel(
      centerId: json['center_id'],
      centerName: json['center_name'],
      centerAddress: json['center_address'],
      workingDays: List<String>.from(json['working_days'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'center_id': centerId,
      'center_name': centerName,
      'center_address': centerAddress,
      'working_days': workingDays,
    };
  }
}
