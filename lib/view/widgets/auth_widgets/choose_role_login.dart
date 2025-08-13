import 'package:flutter/material.dart';
import 'package:med_booking_system/controller/auth_controller/login_controller.dart';
import 'package:flutter/material.dart';

class RoleOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String role;
  final String selectedRole;

  const RoleOption({
    super.key,
    required this.label,
    required this.onTap,
    required this.role,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedRole == role;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey[500],
            fontSize: isSelected ? 15 : 14,
            fontWeight: FontWeight.bold,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

class RoleOptions extends StatelessWidget {
  final LoginControllerImp controller;
  const RoleOptions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 14),
        RoleOption(
          label: "Patient",
          onTap: () => controller.updateChoosenType(controller.patientRole),
          role: controller.patientRole,
          selectedRole: controller.currentRole,
        ),
        Spacer(),
        RoleOption(
          label: "Doctor",
          onTap: () => controller.updateChoosenType(controller.doctorRole),
          role: controller.doctorRole,
          selectedRole: controller.currentRole,
        ),
        SizedBox(width: 14),
      ],
    );
  }
}
