import 'package:flutter/material.dart';
import 'package:med_booking_system/core/class/handling_view.dart';
import 'package:med_booking_system/core/class/status_request.dart';

class CustomMainContainer extends StatelessWidget {
  final List<Widget> children;
final StatusRequest statusRequest;
  const CustomMainContainer({super.key, required this.children, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200.withOpacity(0.3),
            blurRadius: 25,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child:     HandlingDataView(
                          statusRequest: statusRequest,
                          widget: Column(children: children),)
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.g_mobiledata, size: 30),
      label: const Text("Continue with Google"),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
      ),
      onPressed: () {},
    );
  }
}

class RowRememberMeAndForgetPassword extends StatelessWidget {
  const RowRememberMeAndForgetPassword({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Transform.scale(
        //   scale: 0.7,
        //   child: Checkbox(value: false, onChanged: (val) {}),
        // ),
        // const Text("Remember me", style: TextStyle(fontSize: 12)),
        const Spacer(),
        TextButton(
          onPressed:onPressed,
          child: TextButton(
            onPressed:onPressed,
            child: const Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
