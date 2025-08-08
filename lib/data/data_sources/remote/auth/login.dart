import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class LoginData {
  Crud crud;
 LoginData(this.crud);

  postdata(String email , String password, String role) async {
     print(
      "==========================${AppLink.login}==============================",
    );
    print(
      "====================$email======$password=========$role===========",
    );
    var response = await crud.postData(AppLink.login, {
      "login": email,
      "password": password,
      "role": role,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }


 
}
