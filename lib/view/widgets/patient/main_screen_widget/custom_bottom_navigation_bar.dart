import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:med_booking_system/controller/patient/main_patient_screens/main_screen_controller.dart';

Widget buildBottomBar(MainScreenController controller) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(
          0,
          'Home',
          controller,
          FontAwesomeIcons.house,
          FontAwesomeIcons.houseChimneyWindow,
        ),
        _buildNavItem(
          1,
          'Search',
          controller,
          FontAwesomeIcons.magnifyingGlass,
          FontAwesomeIcons.magnifyingGlassArrowRight,
        ),
        _buildNavItem(
          2,
          'Appointments',
          controller,

          FontAwesomeIcons.solidCalendarDays,
          FontAwesomeIcons.calendarDays,
        ),
        _buildNavItem(
          3,
          'Profile',
          controller,
        
          FontAwesomeIcons.user,
            FontAwesomeIcons.solidUser,
        ),
      ],
    ),
  );
}

Widget _buildNavItem(
  int index,
  String label,
  MainScreenController controller,
  IconData icon,
  IconData iconisSelected,
) {
  final isSelected = controller.selectedIndex.value == index;

  return GestureDetector(
    onTap: () {
      controller.selectedIndex.value = index;
      controller.onItemClick(index);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.blue[10],
        borderRadius: BorderRadius.circular(20),
        boxShadow:
            isSelected
                ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
                : [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            isSelected ? iconisSelected : icon,
            size: isSelected ? 18 : 16,
            color: isSelected ? Colors.blue[800] : Colors.grey[500],
          ),

          if (isSelected) ...[
            // const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
