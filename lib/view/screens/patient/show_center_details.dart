import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/center_details_controller.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/view/widgets/patient/center_details_widgets.dart';
class CenterDetailsScreen extends StatelessWidget {
  const CenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(CenterDetailsController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder<CenterDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      CenterAppBar(center: controller.center),   
                      SliverToBoxAdapter(
                        child: CenterDetailsContent(center: controller.center),
                      ),
                    ],
                  ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<CenterDetailsController>(
        builder: (controller) => CenterBottomNavigationBar(
          onTap: controller.center == null
              ? null
              : controller.goToBookingByCenterPage,
        ),
      ),
    );
  }
}
