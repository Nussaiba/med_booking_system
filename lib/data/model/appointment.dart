class Appointment {
  final String id;
  final String doctorName;
  final String specialty;
  final String clinicName;
  final DateTime dateTime;
  final String status; // 'upcoming', 'completed', 'cancelled'
  final String imageUrl;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.clinicName,
    required this.dateTime,
    required this.status,
    required this.imageUrl,
  });
}