class DoctorProfileModel {
  final DoctorProfileData doctorProfile;
  final UserData user;

  DoctorProfileModel({required this.doctorProfile, required this.user});

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      doctorProfile: DoctorProfileData.fromJson(json['doctor_profile']),
      user: UserData.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'doctor_profile': doctorProfile.toJson(), 'user': user.toJson()};
  }
}

class DoctorProfileData {
  final String? aboutMe;
  final int? yearsOfExperience;
  final int specialtyId;
  final String certificate;
  final int appointmentDuration;
  final String status;

  DoctorProfileData({
    required this.aboutMe,
    required this.yearsOfExperience,
    required this.specialtyId,
    required this.certificate,
    required this.appointmentDuration,
    required this.status,
  });

  factory DoctorProfileData.fromJson(Map<String, dynamic> json) {
    return DoctorProfileData(
      aboutMe: json['about_me'],
      yearsOfExperience: json['years_of_experience'],
      specialtyId: json['specialty_id'],
      certificate: json['certificate'],
      appointmentDuration: json['appointment_duration'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'about_me': aboutMe,
      'years_of_experience': yearsOfExperience,
      'specialty_id': specialtyId,
      'certificate': certificate,
      'appointment_duration': appointmentDuration,
      'status': status,
    };
  }
}

class UserData {
  final String fullName;
  final String? profilePhoto;
  final String? birthdate;
  final String? gender;
  final String? address;

  UserData({
    required this.fullName,
    this.profilePhoto,
    this.birthdate,
    this.gender,
    this.address,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      fullName: json['full_name'],
      profilePhoto: json['profile_photo'],
      birthdate: json['birthdate'],
      gender: json['gender'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'profile_photo': profilePhoto,
      'birthdate': birthdate,
      'gender': gender,
      'address': address,
    };
  }
}
