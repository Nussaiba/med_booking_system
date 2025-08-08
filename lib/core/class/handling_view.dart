import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:med_booking_system/core/class/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? 
        // Center(
        //     // child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250),
        //   )
             Center(
                     child: CircularProgressIndicator(),
                   )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                // child: Lottie.asset(AppImageAsset.offline,
                    // width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    // child: Lottie.asset(AppImageAsset.server,
                    //     width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        // child: Lottie.asset(AppImageAsset.nodata,
                        //     width: 250, height: 250),
                      )
                    : widget;
  }
}
