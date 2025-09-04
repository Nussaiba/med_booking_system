import 'package:get/get.dart';
import 'package:med_booking_system/view/screens/auth/choose_account_type.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:med_booking_system/view/screens/auth/forgetpassword/success_resetpassword.dart';
import 'package:med_booking_system/view/screens/auth/login_screen.dart';
import 'package:med_booking_system/view/screens/doctor/auth/doctor_register.dart';
import 'package:med_booking_system/view/screens/doctor/main_doctor_screens/main_doctor_screens.dart';
import 'package:med_booking_system/view/screens/patient/auth/register_screen.dart';
import 'package:med_booking_system/view/screens/auth/success_signup.dart';
import 'package:med_booking_system/view/screens/auth/verifycode_register.dart';
import 'package:med_booking_system/view/screens/patient/booking/booking_screen.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_doctor_details_by_other.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/main_patient_screens.dart';

import 'core/constants/routes.dart';

List<GetPage<dynamic>>? routes = [
  //splash
  // GetPage(
  //     name: "/splash",
  //     page: () => const SplashPage(),
  //     middlewares: [MyMiddleWare()]),

  // //OnBoarding
  // GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  // //Auth
  GetPage(
    name: AppRoute.chooseAccountType,
    page: () => const ChooseAccountType(),
  ),
  GetPage(name: AppRoute.showDoctorProfileByOther, page: () =>  DoctorDetailsPage()),
  GetPage(name: AppRoute.mainPatientScreen, page: () => const MainPatientScreens()),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.patientRegister, page: () => const RegisterScreen()),
  GetPage(
    name: AppRoute.doctorRegister,
    page: () => const DoctorRegisterScreen(),
  ),
  GetPage(
    name: AppRoute.verifyCodeRegister,
    page: () => const VerifyRegisterScreen(),
  ),
  GetPage(
    name: AppRoute.successSignUp,
    page: () => const AccountCreatedScreen(),
  ),

  GetPage(name: AppRoute.forgetPassword, page: () => ForgotPasswordScreen()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPasswordScreen()),

  GetPage(
    name: AppRoute.successResetpassword,
    page: () => const SuccessResetPasswordScreen(),
  ),

  GetPage(name: AppRoute.mainDoctorScreen, page: () => MainDoctorScreens()),


  
];
