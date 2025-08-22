import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/rating_controller.dart';
import 'package:med_booking_system/view/widgets/patient/rating_widgets.dart';

class DoctorFeedbackScreen extends StatelessWidget {
  final RatingController controller = Get.put(RatingController());

   DoctorFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Feedback'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help us improve by telling how was your med visit?'.tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildDoctorInfo(),
            SizedBox(height: 20),
            buildRatingSection(),
            SizedBox(height: 20),
            buildFeedbackForm(),
            Spacer(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }}