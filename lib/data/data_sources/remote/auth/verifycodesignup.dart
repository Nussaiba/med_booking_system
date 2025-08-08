import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class VerifyCodeRegisterData {
  Crud crud;
 VerifyCodeRegisterData(this.crud);

  postdata(String email  ,String verifycode) async {
    print(
      "==========================${AppLink.verifycoderegister}==============================",
    );
    print(
      "==================================$email======$verifycode=============================",
    );

    var response = await crud.postData(AppLink.verifycoderegister, {
      "email" : email,
      "token" : verifycode,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  
  reSendCodeData (String email) async {
    var response = await crud.postData(AppLink.reSendCode, {
    "email" :  email ,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
