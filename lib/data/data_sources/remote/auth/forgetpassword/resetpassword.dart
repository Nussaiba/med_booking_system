import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String code, String password, String passwordConfirmation , String email) async {
      print(
      "==========================${AppLink.resetPassword}==============================",
    );
    print(
      "==================================$password=====$passwordConfirmation=======$code==========$email===================",
    );
    var response = await crud.postData(AppLink.resetPassword, {
      "email" : email,
      "code": code,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
