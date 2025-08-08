class AppLink {
  static const String serverimage = "https://medical.doctorme.site/api";

  static const String server = "https://medical.doctorme.site/api";

  //auth Link ***********************
  static const String signup = "$server/register";
  static const String verifycoderegister = "$server/verify-email";
  static const String login = "$server/login";
  static const String reSendCode = "$server/resend-verification-code";
  // static const String device_token = '$server/device_token';
  static const String logout = "$server/logout";
  static const String refreshtoken = "$server/refresh-token";

  // Forget Password ****************
  static const String forgotpassword = "$server/forgot-password";
  static const String resetPassword = "$server/reset-password";

  //patient
  //patient_home
  static const String centers = "$server/patient/centers";
  static const String specialties = "$server/patient/specialties";
  static const String getDoctorsByCenterAndSpecialty = "$server/patient/profile";
  static const String getDoctorCenters = "$server/patient/doctors";
  static const String getAvailableSlots = "$server/patient/profile";
  static const String requestAppointment = "$server/patient/appointment-requests";
  static const String getAppointmentRequests = "$server/patient/appointment-requests";

  //patient_profile
  static const String patientProfile = "$server/patient/profile";

  //doctor_profile

  static const String doctorRegister = "$server/doctor/register";

  static const String doctorProfile = "$server/doctor/profile";
}
