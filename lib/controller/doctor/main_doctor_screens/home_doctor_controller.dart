import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/show_doctor_profle_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/home/doctor_home_data.dart';
import 'package:med_booking_system/data/model/doctor/doctor_appointment_model.dart';
import 'package:med_booking_system/data/model/doctor/doctor_invitation_mode;.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profile_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/view/screens/doctor/appointments_screens/appoinments_details.dart';
import 'package:med_booking_system/view/screens/patient/show_center_details.dart';

abstract class HomeDoctorController extends GetxController {}

class DoctorHomeControllerImp extends HomeDoctorController {
  DoctorHomeData homeData = DoctorHomeData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  // late String idUserPostOwner;
  // late String account;

  List dataDoctorCenters = [];
  List<DoctorCenterModel> doctorCentersList = [];
  // DoctorProfileModel ? doctorProfileModel;
  getDoctorCenters() async {
    dataDoctorCenters.clear();
    doctorCentersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDoctorCentersData();
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
            DoctorCenterModel.fromJson(dataDoctorCenters[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  // goToCenterDetails(MedicalCenterModel center) {
  //   Get.to(CenterDetailsScreen(), arguments: {'center': center});
  //   // Get.toNamed(AppRoute.opportunityPage,
  //   //     arguments: {"opportuntiyModel": opportuntiyModel});
  // }

  goToAppointmentDetails(int id) {
    // print("ddddddddddddddddddddddddddddddddddddddddddd");
    Get.to(AppointmentDetailsPage(), arguments: {'appointment_id': id});
  }

  DoctorProfileModel? doctor;

  List dataDoctorAppointments = [];
  List<DoctorAppointmentModel> doctorAppointmentsList = [];

  getDoctorAppointments() async {
    dataDoctorAppointments.clear();
    doctorAppointmentsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAppointsmentData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataDoctorAppointments.length}lllllllmmmmmmmmmmlllll");
        dataDoctorAppointments.addAll(response['data']['data']);
        print(
          "=====================================data====+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=======================================",
        );
        print({response['data']});
        // dataopportuntiy.isEmpty
        //     ? statusRequestOpportunity = StatusRequest.failure
        //     : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataDoctorAppointments.length}");
        for (int i = 0; i < dataDoctorAppointments.length; i++) {
          doctorAppointmentsList.add(
            DoctorAppointmentModel.fromJson(dataDoctorAppointments[i]),
          );
        }
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  List dataDoctorInvitations = [];
  List<DoctorInvitationModel> doctorInvitationsList = [];
  getDoctorInvitations() async {
    print("=====getDoctorInvitationtData========");
    dataDoctorInvitations.clear();
    doctorInvitationsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDoctorInvitationtData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataDoctorInvitations.addAll(response['data']);

        print({response['data']});

        print("lll ${dataDoctorInvitations.length}");
        
        for (int i = 0; i < dataDoctorInvitations.length; i++) {
          doctorInvitationsList.add(
            DoctorInvitationModel.fromJson(dataDoctorInvitations[i]),
          );
          
        }
        
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  acceptInvitation(String invitationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.acceptInvitationData(invitationId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
  print(response);
    if (StatusRequest.success == statusRequest) {
     if (response['status'] == 200) {
        print({response['data']});
         getDoctorInvitations();
    getDoctorCenters();
       CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
      } else {
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  rejectInvitation(String invitationId) async {
    statusRequest = StatusRequest.loading;
        update();
    var response = await homeData.rejectInvitationData(invitationId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print({response['data']});
      } else {
         getDoctorInvitations();
    // getDoctorCenters();
        // statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getDoctorInvitations();
    getDoctorCenters();
    getDoctorAppointments();
    final controller = Get.put(ShowDoctorProfleController());
    doctor = await controller.getDoctorProfileByDoctor();

    // account = myServices.box.read("account");
    // idUserPostOwner = myServices.box.read("id");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
