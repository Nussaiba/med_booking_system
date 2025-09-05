import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class MainScreenController extends GetxController {


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
