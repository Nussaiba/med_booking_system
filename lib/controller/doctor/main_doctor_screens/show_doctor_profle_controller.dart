import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/profile/show_by_doctor.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';

class ShowDoctorProfleController extends GetxController {
  DoctorProfileByDoctorData data = DoctorProfileByDoctorData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  DoctorProfileModel? doctor;

  getDoctorProfileByDoctor() async {
    statusRequest = StatusRequest.loading;
    var response = await data.getDoctorProfileByDoctorData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        // statusRequest = StatusRequest.loading;
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        doctor = DoctorProfileModel.fromJson(response['data']);

        print(" Doctor  ${doctor}");

        // doctor = DoctorProfileModel.fromJson(response['data']);
        // print(doctor?.doctorProfile.specialtyId);
        // update();

        // statusRequest = StatusRequest.success;
        // print("doctor");

        // print(doctor);
        update();
        return doctor;
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDoctorProfileByDoctor();
    super.onInit();
  }
}
