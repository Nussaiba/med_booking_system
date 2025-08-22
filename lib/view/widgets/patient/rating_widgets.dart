import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/constants/image_assest.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:med_booking_system/view/widgets/General/custom_button.dart';

Widget buildDoctorInfo() {
  return Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AppImageAsset.doctor3),
      ),
      SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dr. Marilyn Stanton',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Cardiologist',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    ],
  );
}

Widget buildRatingSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('How was your experience?'.tr, style: TextStyle(fontSize: 14)),
      SizedBox(height: 10),
      RatingBar.builder(
        initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder:
            (context, _) => Icon(Icons.star, color: Colors.amber, size: 1),
        onRatingUpdate: (rating) {
          // controller.rating.value = rating;
        },
      ),
      SizedBox(height: 20),
      Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          buildTag('Professional + Attentive doctor'),
          buildTag('Good job'),
          buildTag('Super + Great +'),
          buildTag('I recommend it'),
          buildTag('Wonderful'),
        ],
      ),
    ],
  );
}

Widget buildTag(String text) {
  // return Obx(() {
  // final isSelected = controller.selectedTags.contains(text);
  return FilterChip(
    label: Text(text),
    // selected: isSelected,
    onSelected: (selected) {
      if (selected) {
        // controller.selectedTags.add(text);
      } else {
        // controller.selectedTags.remove(text);
      }
    },
    selectedColor: Colors.blue[100],
    checkmarkColor: Colors.blue,
    labelStyle: TextStyle(
      // color: isSelected ? Colors.blue : Colors.black,
    ),
  );
  // });
}

Widget buildFeedbackForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Share your feedback'.tr, style: TextStyle(fontSize: 16)),
      SizedBox(height: 10),
      TextField(
        // controller: controller.feedbackController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'The level of care and professionalism was exceptional...',
          border: OutlineInputBorder(),
        ),
        // onChanged: (value) => controller.feedbackText.value = value,
      ),
    ],
  );
}

Widget buildActionButtons() {
  return Row(
    children: [
      Expanded(
        child: CustomButton(
          text: 'Cancel',
          onTap: () {
            Get.back();
          },

          color: Colors.grey,
          color2: Colors.grey[400],
        ),
      ),
      SizedBox(width: 15),
      Expanded(
        child: CustomButton(
          text: 'Send review',
          onTap: () {
            Get.back();
            Get.snackbar('Success'.tr, 'Thank you for your feedback!'.tr);
          },
        ),
      ),
    ],
  );
}
