import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/controller/doctor/auth/doctor_register_controller.dart';

class PageProgressIndicator extends StatelessWidget {
  final int totalPages;

  const PageProgressIndicator({
    super.key,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width - 60;
    final double spacing = totalWidth / (totalPages - 1);

    return GetBuilder<DoctorRegisterControllerImp>(
      builder: (controller) => SizedBox(
        height: 60,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                // الخط الرمادي الأساسي
                Positioned(
                  left: 20,
                  right: 20,
                  top: 28,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // الجزء الملون حسب التقدم
                Positioned(
                  left: 20,
                  top: 28,
                  child: Container(
                    height: 3,
                    width: spacing * controller.currentPage,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade400,
                          Colors.blue.shade200,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // النقاط
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(totalPages, (index) {
                    final bool isCompleted = index < controller.currentPage;
                    final bool isActive = index == controller.currentPage;

                    Color circleColor;
                    Color borderColor;
                    Color textColor;

                    if (isActive) {
                      circleColor = Colors.blue.shade500;
                      borderColor = Colors.blue.shade700;
                      textColor = Colors.white;
                    } else if (isCompleted) {
                      circleColor = Colors.blue.shade100;
                      borderColor = Colors.blue.shade200;
                      textColor = Colors.blue.shade800;
                    } else {
                      circleColor = Colors.grey.shade100;
                      borderColor = Colors.grey.shade300;
                      textColor = Colors.grey.shade600;
                    }

                    return GestureDetector(
                      onTap: () {
                        controller.nextPage(index);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: circleColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: borderColor, width: 2),
                          boxShadow: [
                            if (isActive || isCompleted)
                              BoxShadow(
                                color: borderColor.withOpacity(0.25),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
