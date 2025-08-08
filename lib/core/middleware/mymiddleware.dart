// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/core/constants/routes.dart';
// import 'package:med_booking_system/core/services/services.dart';

// class MyMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;
//   MyServices myServices = Get.find();
//   @override
//   RouteSettings? redirect(String? route) {
//     print(myServices.box.read("account"));
//     print(myServices.box.read("step"));

//     Future.delayed(const Duration(seconds: 4), () {
//       if (myServices.box.read("step") == "4") {
//         // return const RouteSettings(name: AppRoute.mainScreens);
//         if (myServices.box.read("account") == "job_seeker") {
//           Get.offAllNamed(AppRoute.mainScreens);
//         } else {
//           if (myServices.box.read("account") == "company")
//           Get.offAllNamed(AppRoute.mainScreensCompany);
//         }
//       } else {
//         if (myServices.box.read("step") == "3") {
//           // return const RouteSettings(name: AppRoute.mainScreens);
//            Get.offAllNamed(AppRoute.login);
//         } else {
//           if (myServices.box.read("step") == "2") {
//             if (myServices.box.read("account") == "job_seeker") {
//             Get.offAllNamed(AppRoute.createProfile);
//           } else {
//             Get.offAllNamed(AppRoute.createcompanyProfile);
//           }
//           } else {
//             if (myServices.box.read("step") == "1") {
//               // return const RouteSettings(name: AppRoute.login);
//             Get.offAllNamed(AppRoute.signUp);
//             } else {
//               Get.offAllNamed(AppRoute.onBoarding);
//             }
//           }
//         }
//       }
//     });

//     return null;
//   }
// }
