import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/auth_controller/successsignup_controller.dart';
import 'package:med_booking_system/core/constants/routes.dart';

class SuccessSignUp extends StatelessWidget {
  SuccessSignUp({Key? key}) : super(key: key);
  final controller = Get.put(SuccessSignUpConroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColor.praimaryColor,

      //   title: Text(
      //     "24".tr,
      //      style: TextStyle(color: AppColor.white),

      //   ),
      // ),
      // body: Container(
      //   padding: const EdgeInsets.all(15),
      //   child: Column(children: [
      //     Center(
      //       child: Lottie.asset(AppImageAsset.success, repeat: false),
      //     ),
      //     Text(
      //       "23".tr,
      //       style: Theme.of(context).textTheme.headline2,
      //     ),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     Text(
      //       "25".tr,
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline1!
      //           .copyWith(color: AppColor.grey),
      //     ),
      //     const Spacer(),
      //     SizedBox(
      //       width: double.infinity,
      //       child: CustomButtomAuth(
      //         text: "82".tr,
      //         color: AppColor.praimaryColor,
      //         onPressed: () {
      //           controller.goToProfile();
      //         },
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 15,
      //     )
      //   ]),
      // )
    );
  }
}

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFCF6),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  size: 100,
                  color: Colors.teal,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Account Created!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Your account was created successfully.\nLet’s set up your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => const CreateProfileScreen()),
                    // );

                    Get.toNamed(AppRoute.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFF0D9488);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text("Create Your Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: primary.withOpacity(0.2),
                child: const Icon(Icons.person, size: 60, color: Colors.teal),
              ),
              const SizedBox(height: 20),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter your name"
                            : null,
              ),
              const SizedBox(height: 20),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.wc),
                ),
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (value) {
                  setState(() => _selectedGender = value);
                },
                validator: (value) => value == null ? "Select gender" : null,
              ),
              const SizedBox(height: 20),

              // Birthday Picker
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  prefixIcon: const Icon(Icons.cake),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() => _selectedDate = picked);
                      }
                    },
                  ),
                ),
                controller: TextEditingController(
                  text:
                      _selectedDate != null
                          ? "${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}"
                          : "",
                ),
                validator:
                    (_) =>
                        _selectedDate == null ? "Select date of birth" : null,
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save profile and move on
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile created!")),
                    );
                    // Navigate to Home or next screen
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Save & Continue",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
