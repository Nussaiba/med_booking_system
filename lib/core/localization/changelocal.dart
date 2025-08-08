// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/core/services/services.dart';

// class LocalController extends GetxController {
//   Locale? language;
//   MyServices myServices = Get.find();
//   changeLanguage(String languageCode) {
//     Locale locale = Locale(languageCode);
//     // myServices.box.write("lang", languageCode);
//     Get.updateLocale(locale);
//   }

//   @override
//   void onInit() {
//     // fcm();
//     // requestPermissionNotification();
//     String? boxLanguage = myServices.box.read("lang");
//     if (boxLanguage == "ar") {
//       language = const Locale("ar");
//     } else if (boxLanguage == "en") {
//       language = const Locale("en");
//     } else {
//       language = Locale(Get.deviceLocale!.languageCode);
//     }
//     myServices.box.write("lang", language.toString());

//     var theme = myServices.box.read("theme");
//     if (theme == true) {
//       apptheme = Themes.customDarkTheme;

//       Get.changeTheme(apptheme!);
//     } else {
//       apptheme = Themes.customLightTheme;

//       Get.changeTheme(apptheme!);
//     }
//     print(
//         "==========Dark===Mode========${myServices.box.read("theme")}========================");
//     super.onInit();
//   }

//   ThemeData? apptheme;
//   changeTheme(value) async {
//     myServices.box.write("theme", value);
//     if (value == true) {
//       print("true");

//       update();
//       apptheme = Themes.customDarkTheme;

//       update();
//     }
//     if (value == false) {
//       print("false");

//       apptheme = Themes.customLightTheme;
//       update();
//     }

//     print(apptheme.toString());
//     Get.changeTheme(apptheme!);
//     MyServices().box.read("account") == 'company'
//         ? Get.offAllNamed(AppRoute.mainScreensCompany)
//         : Get.offAllNamed(AppRoute.mainScreens);
//     print("finish");
//   }
// }
