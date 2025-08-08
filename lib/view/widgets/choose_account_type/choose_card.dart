
  import 'package:flutter/material.dart';

Widget buildRoleCard({
    required String role,
    required String title,
    required String description,
    required IconData icon,
    required dynamic selectedRole,
   required void Function()? onTap
  }) {
    final isSelected = selectedRole == role;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.blue.shade100.withOpacity(0.5)
                  : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected
                    ? Colors.blue.shade100.withOpacity(0.5)
                    : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade700,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
