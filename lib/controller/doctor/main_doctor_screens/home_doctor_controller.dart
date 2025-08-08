import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/main_doctor_screens/show_doctor_profle_controller.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/doctor/doctor_home_data.dart';
import 'package:med_booking_system/data/model/doctor/doctor_profilr_model.dart';
import 'package:med_booking_system/data/model/patient/medical_center_model.dart';
import 'package:med_booking_system/view/screens/patient/profile/show_center_details.dart';

abstract class HomeDoctorController extends GetxController {}

class DoctorHomeControllerImp extends HomeDoctorController {
  DoctorHomeData homeData = DoctorHomeData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  // late String idUserPostOwner;
  // late String account;

  List dataDoctorCenters = [];
  List<DoctorCenterModel> doctorCentersList = [];

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
            DoctorCenterModel.fromJson(dataDoctorCenters[i]),
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

  DoctorProfileModel? doctor;

  @override
  void onInit() async {
    super.onInit();
    final controller = Get.put(ShowDoctorProfleController());
    // doctor=  await  controller.getDoctorProfileByDoctor();

    // getDoctorCenters(doctor.doctorProfile.i);

    getDoctorCenters('2');

    // account = myServices.box.read("account");
    // idUserPostOwner = myServices.box.read("id");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
