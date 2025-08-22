class SearchCenterModel {
  final int id;
  final String name;
  final String location;
  final double? rating;
  final String type;

  SearchCenterModel({
    required this.id,
    required this.name,
    required this.location,
    this.rating,
    required this.type,
  });

  factory SearchCenterModel.fromJson(Map<String, dynamic> json) {
    return SearchCenterModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "location": location,
      "rating": rating,
      "type": type,
    };
  }
}





class SearchSpecialtyModel {
  final int id;
  final String name;
  final int doctorsCount;
  final String type;

  SearchSpecialtyModel({
    required this.id,
    required this.name,
    required this.doctorsCount,
    required this.type,
  });

  factory SearchSpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SearchSpecialtyModel(
      id: json['id'],
      name: json['name'],
      doctorsCount: json['doctors_count'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "doctors_count": doctorsCount,
      "type": type,
    };
  }
}







class SearchDoctorModel {
  final int id;
  final String name;
  final String email;
  final String ?specialty;
  final String? bio;
  final int? experienceYears;
  final String type;

  SearchDoctorModel({
    required this.id,
    required this.name,
    required this.email,
     this.specialty,
     this.bio,
     this.experienceYears,
    required this.type,
  });

  factory SearchDoctorModel.fromJson(Map<String, dynamic> json) {
    return SearchDoctorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      specialty: json['specialty'],
      bio: json['bio'],
      experienceYears: json['experience_years'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "specialty": specialty,
      "bio": bio,
      "experience_years": experienceYears,
      "type": type,
    };
  }
}
