import 'package:http/http.dart' as http;
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class PatientHomeData {
  Crud crud;
  PatientHomeData(this.crud);

  getCentersAndDoctorsBySpecialtyData(String specialtyId) async {
    print("=========================${AppLink.getCentersAndDoctorsBySpecialty}/$specialtyId/centers-doctors===================================");
    var response = await crud.getData("${AppLink.getCentersAndDoctorsBySpecialty}/$specialtyId/centers-doctors");
    return response.fold((l) => l, (r) => r);
  }

  getAllCentersData() async {
    var response = await crud.getData(AppLink.centers);
    return response.fold((l) => l, (r) => r);
  }

  getAllSpecialtiesData() async {
    var response = await crud.getData(AppLink.specialties);
    return response.fold((l) => l, (r) => r);
  }

  getDoctorsByCenterAndSpecialty(String centerId, String specialtyId) async {
    var response = await crud.getData(
      "${AppLink.centers}/$centerId/specialties/$specialtyId/doctors",
    );
    return response.fold((l) => l, (r) => r);
  }

  getDoctorCenters(String doctorId) async {
    var response = await crud.getData(
      "${AppLink.getDoctorCenters}/$doctorId/centers",
    );
    return response.fold((l) => l, (r) => r);
  }

  getAvailableSlotsData(String doctorId, String centerId) async {
    print(
      "============================================${AppLink.getAvailableSlots}/$doctorId/centers/$centerId/available-slots================================================",
    );
    var response = await crud.getData(
      "${AppLink.getAvailableSlots}/$doctorId/centers/$centerId/available-slots",
    );
    return response.fold((l) => l, (r) => r);
  }
}
