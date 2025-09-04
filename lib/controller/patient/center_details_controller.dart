import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/center_details_data.dart';
import 'package:med_booking_system/data/model/patient/new/center_details._model.dart';
import 'package:med_booking_system/view/screens/patient/main_screen/center_bokking_screen.dart';

class CenterDetailsController extends GetxController {
  CenterDetailsData data = CenterDetailsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CenterDetailsModel? center;
  late String centerId;

  // delay() async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //   });
  // }

  getCenterDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await data.getCenterDetailsData(centerId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    update();
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        center = CenterDetailsModel.fromJson(response['data']);

        print(" CenterDetailsModel  $center");

        statusRequest = StatusRequest.success;

        return center;
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.toggle();
  }

  void goToBookingByCenterPage() {
    Get.to(BookingByCenterPage(center: center!));
  }

  @override
  void onInit() {
    centerId = Get.arguments['center_id'].toString();
    getCenterDetails();
    update();
    super.onInit();
  }
}
