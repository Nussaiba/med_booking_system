import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class CenterDetailsData {
  Crud crud;
  CenterDetailsData(this.crud);

  getCenterDetailsData(String centerId) async {
    print(
      "===========================getCenterDetailsData================================"
    );
    print(
      "===================${AppLink.getCenterDetails}/$centerId/details================================",
    );
    var response = await crud.getData("${AppLink.getCenterDetails}/$centerId/details");
    return response.fold((l) => l, (r) => r);
  }
}
