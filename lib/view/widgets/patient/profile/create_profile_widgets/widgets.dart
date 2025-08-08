import 'dart:io';

import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C3E50),
      ),
    ),
  );
}

Widget dropdown(String? value, String label, List<String> options, Function(String?) onChanged) {
  return Container(
    height: 60,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: DropdownButtonFormField<String>(
      value: value,
      decoration: customInputDecoration(label),
      items: options.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'Required' : null,
    ),
  );
}

Widget dateField(String label, DateTime? selectedDate, VoidCallback onTap) {
  return Container(
    height: 60,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          controller: TextEditingController(
            text: selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : "",
          ),
          decoration: customInputDecoration(label),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    ),
  );
}





InputDecoration customInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(fontSize: 14, color: Color(0xFF95A5A6)),
    hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF95A5A6)),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFF3498DB), width: 1),
    ),
  );
}


Widget certificateFileField({
  required String? selectedFileName,
  required VoidCallback onPickFile,
}) {
  return Container(
    height: 60,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: InkWell(
      onTap: onPickFile,
      child: InputDecorator(
        decoration: customInputDecoration("Select your certificate"),
        child: Row(
          children: [
            const Icon(Icons.attach_file, color: Color(0xFFBDC3C7)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                selectedFileName ?? "No file selected",
                style: TextStyle(
                  fontSize: 13,
                  color: selectedFileName != null
                      ? Colors.black87
                      : Color(0xFF95A5A6),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.upload_file, color: Color(0xFF3498DB)),
          ],
        ),
      ),
    ),
  );
}


class CustomProfileImagePicker extends StatelessWidget {
  final File? file;
  final VoidCallback onPickImage;

  const CustomProfileImagePicker({
    super.key,
    required this.file,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.grey[300],
          backgroundImage: file != null ? FileImage(file!) : null,
          child: file == null
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: onPickImage,
          child: Text(
            file == null ? "Choose Photo" : "Change Photo",
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
