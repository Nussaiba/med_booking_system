import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class RefreshTokenData {
  Crud crud;
  RefreshTokenData(this.crud);

  postdata( String refreshToken) async {
    print("start postdata");
    var response = await crud.postData(AppLink.refreshtoken, {
      "refresh_token": refreshToken,
      
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
