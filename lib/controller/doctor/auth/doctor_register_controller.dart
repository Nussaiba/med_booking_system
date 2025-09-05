import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/constants/routes.dart';
import 'package:med_booking_system/core/functions/dialiog_snack.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/choose_image.dart';
import 'package:med_booking_system/data/data_sources/remote/auth/register.dart';
import '../../../data/model/doctor/sp_model.dart';

abstract class DoctorRegisterController extends GetxController {
  signUp();
  goToSignIn();
  showPassWord();
}

class DoctorRegisterControllerImp extends DoctorRegisterController {
  File? certificateFile;
  chooseCertificateFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.single.path != null) {
      setCertificateFile(File(result.files.single.path!));
    }
  }

  void setCertificateFile(File file) {
    certificateFile = file;
    update();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
 late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController aboutMe;
  late TextEditingController yearsOfExperience;
  late TextEditingController appointmentDuration;
  final PageController pageController = PageController();
  int currentPage = 0;

  bool isShowPassword = true;
   bool isShowRePassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  MyServices myServices = Get.find();


  String? gender;
  DateTime? birthdate;
  File? profilePhoto;
  SpecialtyModel ?specialty;
  final List<String> genders = ['male', 'female'];
 
  ImageAndFileData imageData = ImageAndFileData();

 
  getImage() async {
    profilePhoto = await imageData.getImageData();
    update();
  }

  Future<void> pickBirthdate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthdate = picked;
      update();
    } else {
      birthdate = null;
    }
  }
  nextPage(int page) {
    currentPage = page;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  next() {
    if (currentPage == 3) {
      print("doctor register");
      signUp();
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 700),
        curve: Curves.bounceIn,
      );
    }
    update();
  }

  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  onSpecialtyChanged(val) {
    specialty = val;
    print("===${specialty!.name}===${specialty!.id}=");
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }




  showRePassWord() {
    isShowRePassword = isShowRePassword == true ? false : true;

    update();
  }











  @override
  signUp() async {
    //   if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await signUpData.postDoctordata(
      username.text,
      password.text,
      email.text,
      phone.text,
      repassword.text,
      certificateFile!,
      profilePhoto,
        birthdate.toString().substring(0, 10),
      gender!,
      address.text,
      aboutMe.text,
      specialty!.id.toString(),
     
      yearsOfExperience.text,
      appointmentDuration.text,
    );
    print("================$response  Controller");
    // Get.snackbar(response['success'].toString(), response['errors'].toString());
    // print(response['errors']);
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      print(
        ":2222222222222222222222222222222222222222222222222222222222222222222222",
      );
      //     if (response['status'] == 200) {
      //       myServices.box.write("account", accountType.value);
      //       // myServices.box.write("step", "2");
       CustomSnackbar.show(
          title: "success",
          message: "${response['message']}",
          isSuccess: true,
        );
      Get.offNamed(
        AppRoute.verifyCodeRegister,
        arguments: {"email": email.text},
      );
      //       getSnakBar(
      //           "24".tr,
      //           "Verification Code sent to\n ${response['data']['email']}\n ${response['data']['code']} ",
      //           3);
      //     } else if (response['status'] == 422) {
      //       Get.defaultDialog(
      //           title: "203".tr, middleText: "${response["message"]}");
      //       statusRequest = StatusRequest.failure;
      //     } else if (response['status'] == 400) {
      //       Get.defaultDialog(
      //           title: "203".tr, middleText: "${response["message"]}");
      //       statusRequest = StatusRequest.failure;
    }
    //   }
    update();
    // } else {}
  }


  List dataSpecialties = [];
  List<SpecialtyModel> specialtiesList = [];
 
  getSpecialtiesData() async {
    dataSpecialties.clear();
    specialtiesList.clear();
    
    var response = await signUpData.doctorSpecialtiesData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataSpecialties.length}lllllllmmmmmmmmmmlllll");
        dataSpecialties.addAll(response['data']);
     
        print({response['data']});
        print("lll ${dataSpecialties.length}");
       
        for (int i = 0; i < dataSpecialties.length; i++) {
          specialtiesList.add(SpecialtyModel.fromJson(dataSpecialties[i]));
        }
        update();
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
  }
  @override
  void onInit() {
    getSpecialtiesData();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    phone = TextEditingController();




    address = TextEditingController();
    aboutMe = TextEditingController();
    yearsOfExperience = TextEditingController();
    appointmentDuration = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    repassword.dispose();
    phone.dispose();

    address.dispose();
    aboutMe.dispose();
    yearsOfExperience.dispose();
    super.dispose();
  }
  
  @override
  void onClose() {
    if (profilePhoto != null) {
      profilePhoto!.delete();
    }
    if (certificateFile != null) {
      certificateFile!.delete();
    }
    super.onClose();
  }

}
