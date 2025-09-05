import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class DoctorDetailsData {
  Crud crud;
  DoctorDetailsData(this.crud);

  getDoctorDetailsData(String doctorId) async {
    print(
      "===========================getDoctorDetailsData================================"
    );
    print(
      "===================${AppLink.getDoctorDetails}/$doctorId/profile================================",
    );
    var response = await crud.getData("${AppLink.getDoctorDetails}/$doctorId/profile");
    return response.fold((l) => l, (r) => r);
  }
}
