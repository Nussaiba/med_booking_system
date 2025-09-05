class AppLink {
  static const String serverimage = "https://medical.doctorme.site/storage";

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
  static const String getDoctorsByCenterAndSpecialty =
      "$server/patient/profile";
  static const String getDoctorCenters = "$server/patient/doctors";
  static const String getAvailableSlots = "$server/patient/profile";
  static const String requestAppointment =
      "$server/patient/appointment-requests";
  static const String getAppointmentRequests =
      "$server/patient/appointment-requests";

  //patient_profile

  static const String cancelPendingAppointment = "$server/appointments";
  static const String getCenterDetails = "$server/centers";
   static const String getDoctorDetails = "$server/doctors";
  static const String getCentersAndDoctorsBySpecialty = "$server/specialties";

  static const String patientProfile = "$server/patient/profile";

  static const String ratingsDoctor = "$server/patient/ratings/doctor";

  static const String ratingsCenter = "$server/patient/ratings/center";
  static const String getratingsDoctor = "$server/patient/ratings/doctors";

  static const String getratingsCenter = "$server/patient/ratings/centers";

  //search

  static const String search = "$server/search";
  static const String advancedSearch = "$server/search/advanced";
  static const String specialtiesSearch = "$server/search/specialties";
  static const String doctorsSearch = "$server/search/doctors";
  static const String centersSearch = "$server/search/centers";
//doctor
static const String doctorSpecialtiesInRegister = "$server/specialties";
  //doctor_profile

  static const String doctorInvitations = "$server/doctor/invitations";

  static const String doctorRegister = "$server/doctor/register";
  static const String doctorProfile = "$server/doctor/profile";
  static const String doctorCenters = "$server/doctor/centers";
  static const String doctorAppointments = "$server/doctor/appointments";
  static const String doctorPastAppointments =
      "$server/doctor/past-appointments";
}
