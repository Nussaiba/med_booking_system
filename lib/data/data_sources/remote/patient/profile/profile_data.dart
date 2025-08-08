// import 'package:med_booking_system/api_link.dart';
// import 'package:med_booking_system/core/class/crud.dart';

// class PatientProfileData {
//   Crud crud;
//  PatientProfileData(this.crud);

//   postprofiledata(String phone , String adress, String gender, String birthdate) async {
   
//      print(
//       "==========================${AppLink.login}==============================",
//     );
//     print(
//       "====================$phone======$adress=========$gender========$birthdate============",
//     );
//     var response = await crud.postData(AppLink., {
//      "phone": phone,
//   "adress" : adress,
//   "gender": gender,
//   "birthdate": birthdate,
//     });
//     print("daataaaaaaaaaaaaaaa $response");
//     return response.fold((l) => l, (r) => r);
//   }


//   getprofiledata(String email , String password, String role) async {
//      print(
//       "==========================${AppLink.}==============================",
//     );
//     print(
//       "====================$email======$password=========$role===========",
//     );
//     var response = await crud.getData(AppLink.login, {
     
//     });
//     print("daataaaaaaaaaaaaaaa $response");
//     return response.fold((l) => l, (r) => r);
//   }


 
// }
