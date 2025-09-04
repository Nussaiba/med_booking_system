import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

Widget buildTextFormField(
  IconData icon,
  String hinttext,
  String labeltext,
  IconData? iconData,
  TextEditingController? mycontroller,
  bool? obscureText,
  void Function()? onTapIcon,
  String? Function(String?)? valid, {
  int maxLines = 1,
  TextInputType keyboardType = TextInputType.text, 
}) {
  return Column(
    children: [
      TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText ?? false,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labeltext,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          suffixIcon: iconData != null
              ? InkWell(
                  onTap: onTapIcon,
                  child: Icon(iconData),
                )
              : null,
          prefixIcon: Icon(icon),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}


Widget buildDropdownFormField(
  String labelText,
  String? value,
  List<String> options,
  Function(String?) onChanged) {
  return Column(
    children: [
      DropdownButtonFormField<String>(
        value: value,
     
        decoration: InputDecoration(
          // hintText: "Select $labelText",
          hintStyle: const TextStyle(fontSize: 10, color:Colors.grey),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labelText,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        
        ),
        items: options
            .map((opt) => DropdownMenuItem(
                  value: opt,
                  child: Text(opt),
                ))
            .toList(),
        onChanged: onChanged,
      ),
      const SizedBox(height: 20),
    ],
  );
}







Widget buildDateFormField(
  String labelText,
  DateTime? selectedDate,
  VoidCallback onTap) {
  return Column(
    children: [
      TextFormField(    
        controller: TextEditingController(
          text: selectedDate != null
              ? "${selectedDate.toLocal()}".split(' ')[0]
              : "",
        ),
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: "Select $labelText",
          hintStyle: const TextStyle(fontSize: 12),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labelText,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          prefixIcon: Icon( Icons.calendar_today, size:14 , ),
        ),
      ),
    ],
  );
}
