import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/home_data.dart';
import 'package:med_booking_system/data/model/patient/daily_schedule_model.dart';
import 'package:med_booking_system/data/model/patient/doctor_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/data/model/patient/specialty_model.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_center_details.dart';

abstract class PatientHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  
}

class PatientHomeControllerImp extends PatientHomeController {

  PatientHomeData homeData = PatientHomeData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  // late StatusRequest statusRequestOpportunity = StatusRequest.none;

  MyServices myServices = Get.find();
  // var isFabVisible = true.obs;
  List dataSpecialties = [];
  List<SpecialtyModel> specialtiesList = [];
  List dataMedicalCenters = [];
  List<MedicalCenterModel> medicalCentersList = [];

  // late String idUserPostOwner;
  // late String account;

  @override
  getSpecialtiesData() async {
    dataSpecialties.clear();
    specialtiesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAllSpecialtiesData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataSpecialties.length}lllllllmmmmmmmmmmlllll");
        dataSpecialties.addAll(response['data']);
        print(
          "=====================================data===========================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataSpecialties.length}");
        for (int i = 0; i < dataSpecialties.length; i++) {
          specialtiesList.add(SpecialtyModel.fromJson(dataSpecialties[i]));
        }
        update();
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
  }

  getCentersData() async {
    dataMedicalCenters.clear();
    medicalCentersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAllCentersData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataMedicalCenters.length}lllllllmmmmmmmmmmlllll");
        dataMedicalCenters.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataMedicalCenters.length}");
        for (int i = 0; i < dataMedicalCenters.length; i++) {
          medicalCentersList.add(
            MedicalCenterModel.fromJson(dataMedicalCenters[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  List dataDoctorsCenterAndSpecialty = [];
  List<DoctorModel> doctorsCenterAndSpecialtyList = [];

  getDoctorsByCenterAndSpecialty(String centerId, String specialtyId) async {
    dataDoctorsCenterAndSpecialty.clear();
    doctorsCenterAndSpecialtyList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDoctorsByCenterAndSpecialty(
      centerId,
      specialtyId,
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataDoctorsCenterAndSpecialty.length}lllllllmmmmmmmmmmlllll");
        dataDoctorsCenterAndSpecialty.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataDoctorsCenterAndSpecialty.length}");
        for (int i = 0; i < dataDoctorsCenterAndSpecialty.length; i++) {
          doctorsCenterAndSpecialtyList.add(
            DoctorModel.fromJson(dataDoctorsCenterAndSpecialty[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  List dataDoctorCenters = [];
  List<MedicalCenterModel> doctorCentersList = [];

  getDoctorCenters(String doctorId) async {
    dataDoctorCenters.clear();
    doctorCentersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDoctorCenters(doctorId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataDoctorCenters.length}lllllllmmmmmmmmmmlllll");
        dataDoctorCenters.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataDoctorCenters.length}");
        for (int i = 0; i < dataDoctorCenters.length; i++) {
          doctorCentersList.add(
            MedicalCenterModel.fromJson(dataDoctorCenters[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  List dataAvailableSlots = [];
  List<DailyScheduleModel> availableSlotsList = [];

  getAvailableSlots(String doctorId, String centerId) async {
    dataAvailableSlots.clear();
    availableSlotsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAvailableSlotsData(doctorId, centerId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataAvailableSlots.length}lllllllmmmmmmmmmmlllll");
        dataAvailableSlots.addAll(response['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        
        print("lll ${dataAvailableSlots.length}");
        for (int i = 0; i < dataAvailableSlots.length; i++) {
          availableSlotsList.add(
            DailyScheduleModel.fromJson(dataAvailableSlots[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  goToCenterDetails(MedicalCenterModel center) {
    Get.to(CenterDetailsScreen(), arguments: {'center': center});
    // Get.toNamed(AppRoute.opportunityPage,
    //     arguments: {"opportuntiyModel": opportuntiyModel});
  }

  // @override
  goToDoctorDetails(DoctorModel doctor) {
    Get.toNamed(
      AppRoute.showDoctorProfileByOther,
      arguments: {'doctor': doctor},
    );
  }

  // @override
  // goToPageAllPosts() {
  //   Get.toNamed(AppRoute.allPostPage);
  // }

  // goToPageAddOpportunity() {
  //   Get.toNamed(AppRoute.addOpportunity);
  // }

  // goToPageAddPosts() {
  //   Get.toNamed(AppRoute.postpage);
  // }

  @override
  void onInit() async {
    super.onInit();

    getSpecialtiesData();
    getCentersData();


    // account = myServices.box.read("account");
    // idUserPostOwner = myServices.box.read("id");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
