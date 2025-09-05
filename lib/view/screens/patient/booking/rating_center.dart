import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/rating_controller.dart';
import 'package:med_booking_system/view/widgets/General/custom_button.dart';

class CenterRatingScreen extends StatelessWidget {
  final RatingController controller = Get.put(RatingController());

  CenterRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Center Rating',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✨ Title
            Text(
              'How was your experience with the center?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
            ),
            const SizedBox(height: 25),

            // ⭐ Rating Bar
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 40,
                ),
                onRatingUpdate: (rating) {
                  controller.rating.value = rating;
                },
              ),
            ),

            const SizedBox(height: 40),

            // 📝 Feedback label
            Text(
              'Your Feedback',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey.shade700,
              ),
            ),
            const SizedBox(height: 12),

            // 📝 Feedback input box
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: controller.feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'The center was organized but a bit crowded...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),

            const Spacer(),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancel',
                    onTap: () {
                      Get.back();
                    },
                    color: Colors.grey,
                    color2: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomButton(
                    text: 'Submit',
                    onTap: () {
                      controller.sendRating("13");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
