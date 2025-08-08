
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;

  final String hinttext;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String? Function(String?)? valid;
  const CustomTextField({
    super.key,
    required this.icon,
    required this.hinttext,
    required this.labeltext,
    this.iconData,
    this.mycontroller,
    this.obscureText,
    this.onTapIcon,
    this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,

        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
                            fontSize: 14,

            color: Color(0xFF95A5A6)),
          hintText: hinttext,
            hintStyle: TextStyle(
                fontSize: 12,
                   color: Color(0xFF95A5A6)
              ),
          prefixIcon: Icon(icon, color: Color(0xFFBDC3C7)),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder:
                  (child, animation) =>
                      RotationTransition(turns: animation, child: child),
              child: IconButton(
                onPressed: onTapIcon,
                key: ValueKey<bool>(obscureText ?? false),
                icon: Icon(iconData, color: Color(0xFFBDC3C7)),
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF3498DB), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        ),
        // keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
