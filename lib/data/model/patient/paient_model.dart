class PatientProfileModel {
  final Personal personal;
  final Medical medical;
  final EmergencyContact emergencyContacts;
  final Lifestyle lifestyle;
  final FollowUp followUp;
  final Insurance insurance;
  final Appointments appointments;
  final List<dynamic> medicalReports;

  PatientProfileModel({
    required this.personal,
    required this.medical,
    required this.emergencyContacts,
    required this.lifestyle,
    required this.followUp,
    required this.insurance,
    required this.appointments,
    required this.medicalReports,
  });

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) {
    return PatientProfileModel(
      personal: Personal.fromJson(json['personal']),
      medical: Medical.fromJson(json['medical']),
      emergencyContacts: EmergencyContact.fromJson(json['emergency_contacts']),
      lifestyle: Lifestyle.fromJson(json['lifestyle']),
      followUp: FollowUp.fromJson(json['follow_up']),
      insurance: Insurance.fromJson(json['insurance']),
      appointments: Appointments.fromJson(json['appointments']),
      medicalReports: json['medical_reports'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personal': personal.toJson(),
      'medical': medical.toJson(),
      'emergency_contacts': emergencyContacts.toJson(),
      'lifestyle': lifestyle.toJson(),
      'follow_up': followUp.toJson(),
      'insurance': insurance.toJson(),
      'appointments': appointments.toJson(),
      'medical_reports': medicalReports,
    };
  }
}

// ---------------------- Personal ----------------------
class Personal {
  final ContactInfo contactInfo;
  final PersonalDetails personalDetails;

  Personal({required this.contactInfo, required this.personalDetails});

  factory Personal.fromJson(Map<String, dynamic> json) {
    return Personal(
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

  ContactInfo({  required this.email,required this.phone, this.address});

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
  final String? gender;
  final String? birthdate;
  final int? age;

  PersonalDetails({this.gender, this.birthdate, this.age});

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

// ---------------------- Medical ----------------------
class Medical {
  final String? condition;
  final String? medicalHistory;
  final String? allergies;
  final String? currentMedications;
  final String? familyMedicalHistory;
  final String? bloodType;
  final String? height;
  final String? weight;
  final double? bmi;
  final String? bmiCategory;
  final int? age;

  Medical({
    this.condition,
    this.medicalHistory,
    this.allergies,
    this.currentMedications,
    this.familyMedicalHistory,
    this.bloodType,
    this.height,
    this.weight,
    this.bmi,
    this.bmiCategory,
    this.age,
  });

  factory Medical.fromJson(Map<String, dynamic> json) {
    return Medical(
      condition: json['condition'],
      medicalHistory: json['medical_history'],
      allergies: json['allergies'],
      currentMedications: json['current_medications'],
      familyMedicalHistory: json['family_medical_history'],
      bloodType: json['blood_type'],
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num?)?.toDouble(),
      bmiCategory: json['bmi_category'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
        'condition': condition,
        'medical_history': medicalHistory,
        'allergies': allergies,
        'current_medications': currentMedications,
        'family_medical_history': familyMedicalHistory,
        'blood_type': bloodType,
        'height': height,
        'weight': weight,
        'bmi': bmi,
        'bmi_category': bmiCategory,
        'age': age,
      };
}

// ---------------------- Emergency ----------------------
class EmergencyContact {
  final String? name;
  final String? phone;

  EmergencyContact({this.name, this.phone});

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      name: json['emergency_contact_name'],
      phone: json['emergency_contact_phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'emergency_contact_name': name,
        'emergency_contact_phone': phone,
      };
}

// ---------------------- Lifestyle ----------------------
class Lifestyle {
  final String? smokingStatus;
  final String? alcoholConsumption;
  final String? lifestyleNotes;

  Lifestyle({this.smokingStatus, this.alcoholConsumption, this.lifestyleNotes});

  factory Lifestyle.fromJson(Map<String, dynamic> json) {
    return Lifestyle(
      smokingStatus: json['smoking_status'],
      alcoholConsumption: json['alcohol_consumption'],
      lifestyleNotes: json['lifestyle_notes'],
    );
  }

  Map<String, dynamic> toJson() => {
        'smoking_status': smokingStatus,
        'alcohol_consumption': alcoholConsumption,
        'lifestyle_notes': lifestyleNotes,
      };
}

// ---------------------- FollowUp ----------------------
class FollowUp {
  final String? lastVisit;
  final String? nextFollowUp;
  final String? treatmentNotes;

  FollowUp({this.lastVisit, this.nextFollowUp, this.treatmentNotes});

  factory FollowUp.fromJson(Map<String, dynamic> json) {
    return FollowUp(
      lastVisit: json['last_visit'],
      nextFollowUp: json['next_follow_up'],
      treatmentNotes: json['treatment_notes'],
    );
  }

  Map<String, dynamic> toJson() => {
        'last_visit': lastVisit,
        'next_follow_up': nextFollowUp,
        'treatment_notes': treatmentNotes,
      };
}

// ---------------------- Insurance ----------------------
class Insurance {
  final String? provider;
  final String? number;
  final String? expiry;
  final bool? isExpired;

  Insurance({this.provider, this.number, this.expiry, this.isExpired});

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      provider: json['provider'],
      number: json['number'],
      expiry: json['expiry'],
      isExpired: json['is_expired'],
    );
  }

  Map<String, dynamic> toJson() => {
        'provider': provider,
        'number': number,
        'expiry': expiry,
        'is_expired': isExpired,
      };
}

// ---------------------- Appointments ----------------------
class Appointments {
  final List<dynamic> upcoming;
  final List<dynamic> old;

  Appointments({required this.upcoming, required this.old});

  factory Appointments.fromJson(Map<String, dynamic> json) {
    return Appointments(
      upcoming: json['upcoming'] ?? [],
      old: json['old'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        'upcoming': upcoming,
        'old': old,
      };
}
