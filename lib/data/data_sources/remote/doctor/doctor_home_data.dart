import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';
import 'package:path_provider/path_provider.dart';

class DoctorHomeData {
  Crud crud;
  DoctorHomeData(this.crud);



  getDoctorCenters(String doctorId) async {
    var response = await crud.getData(
      "${AppLink.getDoctorCenters}/$doctorId/centers",
    );
    return response.fold((l) => l, (r) => r);
  }}