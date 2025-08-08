import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorFeedbackScreen extends StatelessWidget {
  final DoctorFeedbackController controller = Get.put(DoctorFeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'.tr),
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
            _buildDoctorInfo(),
            SizedBox(height: 20),
            _buildRatingSection(),
            SizedBox(height: 20),
            _buildFeedbackForm(),
            Spacer(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/doctor_placeholder.png'),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Marilyn Stanton',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Cardiologist',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How was your experience?'.tr,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            controller.rating.value = rating;
          },
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTag('Professional + Attentive doctor'),
            _buildTag('Good job'),
            _buildTag('Super + Great +'),
            _buildTag('I recommend it'),
            _buildTag('Wonderful'),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Obx(() {
      final isSelected = controller.selectedTags.contains(text);
      return FilterChip(
        label: Text(text),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            controller.selectedTags.add(text);
          } else {
            controller.selectedTags.remove(text);
          }
        },
        selectedColor: Colors.blue[100],
        checkmarkColor: Colors.blue,
        labelStyle: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
        ),
      );
    });
  }

  Widget _buildFeedbackForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Share your feedback'.tr,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller.feedbackController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'The level of care and professionalism was exceptional...',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => controller.feedbackText.value = value,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'.tr),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Obx(() => ElevatedButton(
                onPressed: controller.isFormValid.value ? () {
                  controller.submitFeedback();
                  Get.back();
                  Get.snackbar('Success'.tr, 'Thank you for your feedback!'.tr);
                } : null,
                child: Text('Send review'.tr),
              )),
        ),
      ],
    );
  }
}

class DoctorFeedbackController extends GetxController {
  var rating = 0.0.obs;
  var selectedTags = <String>[].obs;
  var feedbackText = ''.obs;
  var isFormValid = false.obs;

  TextEditingController feedbackController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ever(rating, (_) => validateForm());
    ever(selectedTags, (_) => validateForm());
    ever(feedbackText, (_) => validateForm());
  }

  void validateForm() {
    isFormValid.value = rating.value > 0 && feedbackText.value.isNotEmpty;
  }

  void submitFeedback() {
    // Here you would typically send the data to your backend
    print({
      'rating': rating.value,
      'tags': selectedTags,
      'feedback': feedbackText.value
    });
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}