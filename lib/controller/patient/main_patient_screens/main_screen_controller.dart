import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/data/model/s.dart';

class MainScreenController extends GetxController {
  final List<Specialty> specialties = [
    Specialty(icon: FontAwesomeIcons.heart, name: 'Cardiology', id: '1'),
    Specialty(icon: FontAwesomeIcons.tooth, name: 'Dentistry', id: '2'),
    Specialty(icon: FontAwesomeIcons.eye, name: 'Ophthalmology', id: '3'),
    Specialty(icon: FontAwesomeIcons.brain, name: 'Neurology', id: '4'),
    Specialty(icon: FontAwesomeIcons.baby, name: 'Pediatrics', id: '5'),
  ];
 

  var selectedIndex = 0.obs;
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();

  var page = RxInt(0);
  void onItemClick(index) {
    if (index != page.value) {
      page(index);
      selectedIndex.value = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();  
  }
}
