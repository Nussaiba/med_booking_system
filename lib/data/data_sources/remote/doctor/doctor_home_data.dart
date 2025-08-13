import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class DoctorHomeData {
  Crud crud;
  DoctorHomeData(this.crud);
  getDoctorCentersData() async {
    print(
      "==========================${AppLink.doctorCenters}==============================",
    );

    var response = await crud.getData(AppLink.doctorCenters);
    return response.fold((l) => l, (r) => r);
  }
}
