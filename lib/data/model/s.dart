import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Specialty {
  final IconData icon;
  final String name;
  final String? id; // اختياري

  Specialty({
    required this.icon,
    required this.name,
    this.id,
  });

  // تحويل إلى Map
  Map<String, dynamic> toMap() {
    return {
      'icon': icon.codePoint,
      'name': name,
      'id': id,
    };
  }

  // تحويل من Map
  factory Specialty.fromMap(Map<String, dynamic> map) {
    return Specialty(
      icon: IconData(map['icon'], fontFamily: 'FontAwesomeSolid'),
      name: map['name'],
      id: map['id'],
    );
  }
}




