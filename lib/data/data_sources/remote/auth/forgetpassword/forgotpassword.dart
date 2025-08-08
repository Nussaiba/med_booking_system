
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

   postdata(String email) async {
      print(
      "==========================${AppLink.forgotpassword}==============================",
    );
    print(
      "==================================$email===================================",
    );
    var response = await crud.postData(AppLink.forgotpassword, {
      "email": email,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
