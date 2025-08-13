






class PatientProfileModel {
  final PersonalInfo personal;
  final Appointments appointments;
  final List<MedicalReport> medicalReports;

  PatientProfileModel({
    required this.personal,
    required this.appointments,
    required this.medicalReports,
  });

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) {
    return PatientProfileModel(
      personal: PersonalInfo.fromJson(json['personal']),
      appointments: Appointments.fromJson(json['appointments']),
      medicalReports: (json['medical_reports'] as List)
          .map((e) => MedicalReport.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'personal': personal.toJson(),
        'appointments': appointments.toJson(),
        'medical_reports': medicalReports.map((e) => e.toJson()).toList(),
      };
}

class PersonalInfo {
  final ContactInfo contactInfo;
  final PersonalDetails personalDetails;

  PersonalInfo({
    required this.contactInfo,
    required this.personalDetails,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      contactInfo: ContactInfo.fromJson(json['contact_info']),
      personalDetails: PersonalDetails.fromJson(json['personal_details']),
    );
  }

  Map<String, dynamic> toJson() => {
        'contact_info': contactInfo.toJson(),
        'personal_details': personalDetails.toJson(),
      };
}

class ContactInfo {
  final String email;
  final String phone;
  final String? address;

  ContactInfo({
    required this.email,
    required this.phone,
    this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'phone': phone,
        'address': address,
      };
}

class PersonalDetails {
  final String gender;
  final String birthdate;
  final int age;

  PersonalDetails({
    required this.gender,
    required this.birthdate,
    required this.age,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return PersonalDetails(
      gender: json['gender'],
      birthdate: json['birthdate'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'birthdate': birthdate,
        'age': age,
      };
}

class Appointments {
  final List<Appointment> upcoming;
  final List<Appointment> old;

  Appointments({
    required this.upcoming,
    required this.old,
  });

  factory Appointments.fromJson(Map<String, dynamic> json) {
    return Appointments(
      upcoming: (json['upcoming'] as List)
          .map((e) => Appointment.fromJson(e))
          .toList(),
      old: (json['old'] as List).map((e) => Appointment.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'upcoming': upcoming.map((e) => e.toJson()).toList(),
        'old': old.map((e) => e.toJson()).toList(),
      };
}

class Appointment {
  final String? date; // عدلي حسب الحاجة (ممكن dateTime)
  final String? doctor;
  final String? department;

  Appointment({this.date, this.doctor, this.department});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      date: json['date'],
      doctor: json['doctor'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'doctor': doctor,
        'department': department,
      };
}

class MedicalReport {
  final String? id;
  final String? title;
  final String? description;
  final String? date;

  MedicalReport({this.id, this.title, this.description, this.date});

  factory MedicalReport.fromJson(Map<String, dynamic> json) {
    return MedicalReport(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
      };
}
