// import 'package:flutter/material.dart';

// class BookAppointmentPage extends StatefulWidget {
//   const BookAppointmentPage({super.key});

//   @override
//   State<BookAppointmentPage> createState() => _BookAppointmentPageState();
// }

// class _BookAppointmentPageState extends State<BookAppointmentPage> {
//   String? selectedSpecialty;
//   String? selectedDoctor;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   final List<String> specialties = [
//     "Cardiology",
//     "Dermatology",
//     "Neurology",
//     "Orthopedics",
//   ];

//   final List<String> doctors = [
//     "Dr. David Patel",
//     "Dr. Sarah Johnson",
//     "Dr. Mark Lee",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("Book Appointment"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         elevation: 0.5,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sectionTitle("Search Options"),
//             const SizedBox(height: 12),
//             _dropdownField(
//               value: selectedSpecialty,
//               label: "Specialty",
//               options: specialties,
//               onChanged: (val) => setState(() => selectedSpecialty = val),
//             ),
//             const SizedBox(height: 14),
//             _dropdownField(
//               value: selectedDoctor,
//               label: "Doctor",
//               options: doctors,
//               onChanged: (val) => setState(() => selectedDoctor = val),
//             ),
//             const SizedBox(height: 24),

//             _sectionTitle("Appointment Details"),
//             const SizedBox(height: 12),
//             _datePickerField("Choose Date", selectedDate, () async {
//               final DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime.now(),
//                 lastDate: DateTime.now().add(const Duration(days: 60)),
//               );
//               if (picked != null) {
//                 setState(() => selectedDate = picked);
//               }
//             }),
//             const SizedBox(height: 14),
//             _timePickerField("Choose Time", selectedTime, () async {
//               final TimeOfDay? picked = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//               );
//               if (picked != null) {
//                 setState(() => selectedTime = picked);
//               }
//             }),
//             const SizedBox(height: 40),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   if (selectedDoctor != null &&
//                       selectedSpecialty != null &&
//                       selectedDate != null &&
//                       selectedTime != null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Appointment booked successfully!")),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Please fill all fields.")),
//                     );
//                   }
//                 },
//                 icon: const Icon(Icons.check_circle_outline),
//                 label: const Text("Confirm Appointment"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//     );
//   }

//   Widget _dropdownField({
//     required String? value,
//     required String label,
//     required List<String> options,
//     required Function(String?) onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       value: value,
//       decoration: _inputDecoration(label),
//       items: options
//           .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//           .toList(),
//       onChanged: onChanged,
//     );
//   }

//   Widget _datePickerField(String label, DateTime? selectedDate, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AbsorbPointer(
//         child: TextFormField(
//           controller: TextEditingController(
//             text: selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : "",
//           ),
//           decoration: _inputDecoration(label),
//         ),
//       ),
//     );
//   }

//   Widget _timePickerField(String label, TimeOfDay? selectedTime, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AbsorbPointer(
//         child: TextFormField(
//           controller: TextEditingController(
//             text: selectedTime != null ? selectedTime.format(context) : "",
//           ),
//           decoration: _inputDecoration(label),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.blueAccent),
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_booking_system/data/model/all_model.dart';
// import 'package:med_booking_system/view/widgets/General/custom_button.dart';

// class BookingPage extends StatelessWidget {
//   BookingPage({super.key});
//   final BookingController controller = Get.put(BookingController());
//   @override
//   Widget build(BuildContext context) {
//     final doctor = controller.doctor;
//     return Scaffold(
//       appBar: AppBar(title: const Text("Book Appointment")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Header Info
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(doctor.profileImage),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         doctor.fullName,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         doctor.specialty,
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 24),

//             // اختيار المركز
//             DropdownButtonFormField(
//               value: controller.selectedCenter.value,
//               items:
//                   doctor.centers.map((center) {
//                     return DropdownMenuItem(
//                       value: center,
//                       child: Text(center.name),
//                     );
//                   }).toList(),
//               onChanged: (value) {
//                 controller.selectCenter(value!);
//               },
//               decoration: InputDecoration(
//                 labelText: "Select Center",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // اختيار اليوم
//             Obx(() {
//               final slots = controller.selectedCenter.value.workingDays;

//               return SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: slots.length,
//                   itemBuilder: (context, index) {
//                     final slot = slots[index];
//                     final isSelected =
//                         controller.selectedDate.value == slot.;
//                     return GestureDetector(
//                       onTap: () => controller.selectDate(slot.date),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 10,
//                         ),
//                         margin: const EdgeInsets.only(right: 10),
//                         decoration: BoxDecoration(
//                           color:
//                               isSelected ? Colors.blueAccent : Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "${slot.date.day}/${slot.date.month}",
//                             style: TextStyle(
//                               color: isSelected ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }),

//             const SizedBox(height: 20),

//             // اختيار الوقت
//             Obx(() {
//               final selectedDate = controller.selectedDate.value;
//               final slot = controller.getSlotForDate(selectedDate);
//               if (slot == null)
//                 return const Text("No slots available for this day.");

//               return Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children:
//                     slot.times.map((time) {
//                       final isSelected = controller.selectedTime.value == time;
//                       return GestureDetector(
//                         onTap: () => controller.selectTime(time),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color:
//                                 isSelected
//                                     ? Colors.blueAccent
//                                     : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text(
//                             time,
//                             style: TextStyle(
//                               color: isSelected ? Colors.white : Colors.black87,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//               );
//             }),

//             const Spacer(),

//             // زر الحجز
//             CustomButton(
//                 text: "Confirm Appointment",
//                 onTap:
//                     controller.canConfirm
//                         ? () {
//                           controller.confirmBooking();
//                           Get.snackbar("Success", "Appointment booked!");
//                         }
//                         : null,
//               ),

//           ],
//         ),
//       ),
//     );
//   }
// }

// class BookingController extends GetxController {
//   late DoctorModel doctor;

//   var selectedCenter = Rx<CenterModel>(CenterModel.empty());
//   var selectedDate = Rx<DateTime>(DateTime.now());
//   var selectedTime = Rx<String>("");

//   void selectCenter(CenterModel center) {
//     selectedCenter.value = center;
//     selectedDate.value = center.availableSlots.first.date;
//     selectedTime.value = "";
//   }

//   void selectDate(DateTime date) {
//     selectedDate.value = date;
//     selectedTime.value = "";
//   }

//   void selectTime(String time) {
//     selectedTime.value = time;
//   }

//   AvailableSlot? getSlotForDate(DateTime date) {
//     return selectedCenter.value.availableSlots.firstWhereOrNull(
//       (slot) => slot.date == date,
//     );
//   }

//   bool get canConfirm =>
//       selectedDate.value != null && selectedTime.value.isNotEmpty;

//   void confirmBooking() {
//     // هنا منضيف منطق الحجز الفعلي أو إرسال الطلب للسيرفر
//     print(
//       "Booked for ${selectedDate.value} at ${selectedTime.value} in ${selectedCenter.value.name}",
//     );
//   }

//   @override
//   void onInit() {
//     print("doctor");
//     doctor = Get.arguments['doctor'];
//     print(doctor.about);
//     selectedCenter.value = doctor.centers.first;
//     selectedDate.value = doctor.centers.first.availableSlots.first.date;
//     super.onInit();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/patient/booking_from_doctor_controller.dart';
import 'package:med_booking_system/core/functions/time.dart';
import 'package:med_booking_system/data/model/all_model.dart';
import 'package:med_booking_system/view/widgets/patient/booking_widgets/custom_widget.dart';
import 'package:med_booking_system/view/widgets/patient/show_doctor_profile/show_doctor_profile_by_other.dart';

class BookingPage extends StatelessWidget {
  BookingPage({Key? key}) : super(key: key);

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    final doctor = controller.doctor;

    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Obx(() {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DoctorInfoCard(
                          profileImage: doctor.profileImage,
                          fullName: doctor.fullName,
                          specialty: doctor.specialty,
                        ),

                        const SizedBox(height: 24),
                        CustomDropdown<CenterModel>(
                          items: doctor.centers,
                          selectedItem: controller.selectedCenter.value,
                          onChanged: (val) {
                            if (val != null) controller.selectCenter(val);
                          },
                          label: "Select Center",
                          displayValue: (c) => c.name,
                          itemDisplay:
                              (center) => DropDownCenterItem(center: center,),
                        ),

                        const SizedBox(height: 20),
                        SectionTitle("Select Date:"),

                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.availableDates.length,
                            itemBuilder: (_, index) {
                              final date = controller.availableDates[index];
                              final isSelected =
                                  controller.selectedDate.value == date;

                              return GestureDetector(
                                onTap: () => controller.selectDate(date),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.blueAccent
                                            : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _dayName(date.weekday),
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black87,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "${date.day}/${date.month}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        SectionTitle("Select Time:"),

                        Wrap(
                          spacing: 4,
                          runSpacing: 6,
                          children:
                              controller.generateAvailableTimes().map((time) {
                                final isSelected =
                                    controller.selectedTime.value == time;
                                return ChoiceChip(
                                  label: Text(
                                    time,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    if (selected) controller.selectTime(time);
                                  },
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // زر التأكيد
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        controller.canConfirm
                            ? () {
                              controller.confirmBooking();
                              Get.snackbar(
                                "Success",
                                "Appointment booked successfully!",
                              );
                            }
                            : null,
                    child: const Text("Confirm Appointment"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String _dayName(int weekday) {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[weekday - 1];
  }
}

class DropDownCenterItem extends StatelessWidget {
  final CenterModel center;
  const DropDownCenterItem({
    super.key, required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          center.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          center.address,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          "${formatTimeOfDay(center.workingStart)} - ${formatTimeOfDay(center.workingEnd)}",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
