import 'package:med_booking_system/api_link.dart';
import '../../../../core/class/crud.dart';

class LogoutData {
  Crud crud;
  LogoutData(this.crud);

   logout() async {
    var response = await crud.postData(AppLink.logout,{});
    print("Response data: $response");
    return response.fold((l) => l, (r) => r);
  }
}

